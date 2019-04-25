#!/usr/bin/python
#coding:utf-8
#
#   the instCreator create an inst for esm
#
import sys, os
sys.path.append('../parser')
sys.path.append('../template')
sys.path.append('../ir')
from codeGen import codeGenerator
from parserMod import Parser
from ir import Model
import argparse
from configType import TimeConfig
from MetaManager import MetaManager
from instParser import InstParser
from ModelManager import ConfModel
sys.path.append('../ErrorHandle')
from ErrorHandle import WrongPathError

'''
codeMapper work as a batch code generator:
get a mapper: templateFile, codeFile, [cfgs_list]

inst dict structure spec:

inst----
     |
     \bin: excutive
     \conf: config nml file
     \include: relavent include and mod
     \lib: relavent lib
     \models------
            |
            \comp
            \cpl
     \src: nml describe input
input----
     |
     \map  : map nc files
     \models : comps depend data
'''

class InstArgsParser:
    def __init__(self):
        self.argParser = argparse.ArgumentParser()
        self.args = None
        self.argParser.add_argument("-regen", "--regenerate",help="whether to regenerate coupler code", action="store_true")
        self.argParser.add_argument("-make","--makeCode", help="whether to build code to executabels", action="store_true")
        self.argParser.add_argument("-overwrite","--overwriteDir", help="whether to recreate new inst dir", action="store_true")
        #self.argParser.add_argument("")
        self.argParser.add_argument("-rest","--restart", help="whether do restart", action="store_true")
        self.argParser.add_argument("-hist","--history", help="wheter do hist archive", action="store_true")

    def argSet(self):
        self.args = self.argParser.parse_args()

    def instCreate(self):
        instCreator = InstCreator(regen=self.args.regenerate, make=self.args.makeCode,\
                                  overwrite=self.args.overwriteDir, restart=self.args.restart, \
                                  history=self.args.history)
        instCreator.instCreate()

class TempConfig:
    def __init__(self, template, codeFile, cfgs):
        self.template = template
        self.codeFile = codeFile
        if type(cfgs) != type({}):
            raise TypeError("cfgs not list") 
        self.cfgs = cfgs
        

class CodeMapper:
    def __init__(self, mappers=[]):
        self.mappers = mappers

    def addTempConf(self, tempConf):
        self.mapper.append(tempConf)

    def genCode(self):
        for spec in self.mappers:
            code = codeGenerator(spec.template, spec.codeFile)
            print spec.template
            for cfg in spec.cfgs:
                code.addList(cfg, spec.cfgs[cfg])
            code.generate()

def get_merge_cfg(attrVects):
    merge_cfg = {}
    for av in attrVects:
        merge_cfg[av] = {}
        aVect = attrVects[av][0]
        avDict = {}
        avDict['gm'] = aVect.srcGsmap
        avDict['gn'] = aVect.dstGsmap 
        avDict['dst'] = aVect.dstGrid
        avDict['src'] = aVect.srcGrid
        avDict['mapperName'] = aVect.mapperName
        avDict['w_file'] = aVect.mapperFile
        avDict['samegrid'] = '.false.'
        if avDict['w_file'] == "samegrid":
            avDict['samegrid'] = '.true.'
        avDict['mapperType'] = aVect.mapperType
        merge_cfg[av] = avDict
    return merge_cfg

def get_SMat_relation(attrVects):
    print attrVects
    model_names = []
    model_SMats = {}
    gsmap_dict = {}
    for av in attrVects:
        dst_model = attrVects[av][0].dstModel
        model_name = dst_model.name
        model_gsmap_name = attrVects[av][0].srcModel.gsMaps['cpl'].name
        model_SMats[model_name] = {}
        model_SMats[model_name]['src'] = av
        model_SMats[model_name]['dst'] = []
        src_model_name = attrVects[av][0].srcModel.name
        gsmap_dict[src_model_name] = model_gsmap_name
        #model_SMats[model_name]['gm'] = model_gsmap_name
        model_names.append(model_name)
    print model_SMats
    exit()
    for av in attrVects:
        for src_x_dst_x_av in attrVects[av]:
            src_model = src_x_dst_x_av.srcModel
            dst_model = src_x_dst_x_av.dstModel
            src_model_name = src_model.name
            dst_model_name = dst_model.name
            model_gsmap_name = src_model.gsMaps['cpl'].name
            dst_gsmap_name = dst_model.gsMaps['cpl'].name
            dst_field = src_x_dst_x_av.field

            dst_info = {
		'dst_model_name': dst_model_name,
                'dst_av': src_x_dst_x_av,
                'dst_gm': dst_gsmap_name,
                'dst_mapper': src_x_dst_x_av.mapperName,
                'dst_field': dst_field,
                'w_file': src_x_dst_x_av.mapperFile,
		'smat_size':3
            } 
            if src_model_name not in model_SMats:
                model_SMats[src_model_name] = {}
                model_SMats[src_model_name]['src'] = src_x_dst_x_av.srcName
                model_SMats[src_model_name]['dst'] = []
                model_gsmap_name = src_model.gsMaps['cpl'].name
                model_SMats[src_model_name]['gm'] = model_gsmap_name
            model_SMats[src_model_name]['dst'].append(dst_info)
    for src_model in model_SMats:
        model_SMats[src_model]['gm'] = gsmap_dict[src_model]

    return model_SMats



class InstCreator:
    '''
        presently, we can't support spec without enough xmls
    '''
    couplerCodePath='/../../baseCpl'
    BCGenPath = '/../..'
    def __init__(self,regen=False, make=False, overwrite=False, restart=False, history=False):
        absPath = os.getcwd()
        InstCreator.BCGenPath = absPath+InstCreator.BCGenPath
        InstCreator.couplerCodePath = absPath+InstCreator.couplerCodePath
        self.metaManager = MetaManager(InstCreator.BCGenPath)        
        self.parser = None     
        self.confXmlPath = {}
        self.setDefaultXmlPath()
        self.args = {}
        self.args['regen'] = regen
        self.args['make'] = make
        self.args['overwrite'] = overwrite
        self.args['rest'] = restart
        self.args['hist'] = history

    def setDefaultXmlPath(self):
        self.absPath = os.getcwd()
        prefix = self.absPath+"/../../composing/"
        self.confXmlPath['instSetup.xml'] = prefix+"instSetup.xml"
        self.confXmlPath['setup.xml'] = prefix+"setup.xml"
        self.confXmlPath['coupler.xml'] = prefix+"coupler.xml"
        self.confXmlPath['models.xml'] = prefix+"models.xml"
        self.confXmlPath['deploy.xml'] = prefix+"deploy.xml"
        self.confXmlPath['field.xml'] = prefix+"field.xml"
        self.confXmlPath['option.xml'] = prefix+"option.xml"
        self.confXmlPath['instSetup.xml'] = prefix+"instSetup.xml"
        # newly update
        self.confXmlPath['regriddingFile.xml'] = prefix+"regriddingFile.xml"
        self.confXmlPath['fractionSet.xml'] = prefix+"fractionSet.xml"
        self.confXmlPath['fakeModel.xml'] = prefix+"fakeModel.xml"

    def setXmlPath(self, name, val):
        if name not in self.confXmlPath:
            raise NoKeyError("no such key in confXmlPath")
        self.confXmlPath[name] = val

    def getIr(self):
        setupPath = self.confXmlPath['setup.xml']
        couplerPath = self.confXmlPath['coupler.xml']
        modelsPath = self.confXmlPath['models.xml']
        deployPath = self.confXmlPath['deploy.xml']
        fieldPath =  self.confXmlPath['field.xml']
        optionPath = self.confXmlPath['option.xml']
        instSetupPath = self.confXmlPath['instSetup.xml']
        # newly add
        fracSetPath = self.confXmlPath['fractionSet.xml']
        self.confXmlPath['coupler.xml'] = "./coupler.xml"
        self.parser = Parser(setup=True, rest=self.args['rest'],\
                             hist=self.args['hist'], fileSpec=self.confXmlPath)
        self.parser.parse()
        self.metaManager.setConfigMeta(optionPath)
        self.metaManager.setMacroMeta(instSetupPath)

        self.proc_cfgs = [self.parser.models[m] for m in self.parser.models]
        self.field_cfgs = [self.parser.fldMetaDict[m] for m in self.parser.fldMetaDict] 
        self.fieldVar_cfgs = self.parser.fldDict
        self.merge_subroutines = [self.parser.subroutine[m] for m in self.parser.subroutine]
        self.subrt_cfgs = [node.data.strFormat for list_ in self.parser.runSubroutine \
                           for node in list_]
        self.fraction_cfgs = self.parser.fractions
        self.fakeModel_cfgs = self.parser.fakeModels
        self.deploy_cfgs = self.parser.deploy
        #self.merge_cfgs = get_SMat_relation(self.parser.attrVectCouple)
        self.merge_cfgs = get_merge_cfg(self.parser.attrVectCouple)
        self.conf_cfgs = {}
        self.conf_cfgs['instPath'] = self.metaManager.instPath
        nmlfilePath = self.metaManager.instPath+"/conf/"+self.metaManager.nmlfile
        self.conf_cfgs['nmlfile'] = nmlfilePath
        self.conf_cfgs['confPath'] = self.metaManager.confPath
        self.conf_cfgs['dataPath'] = self.metaManager.dataPath
        pioNml = self.metaManager.instPath+"/conf/"+self.metaManager.pioNml
        self.conf_cfgs['pioNml'] = pioNml
        dataNmlPath = self.metaManager.instPath+"/src/"+self.metaManager.dataNml
        self.conf_cfgs['dataNml'] = dataNmlPath
        dataRcPath = self.metaManager.instPath+"/src/"+self.metaManager.datarc
        self.conf_cfgs['datarc'] = dataRcPath
        if self.args['rest'] :
            self.conf_cfgs['rest'] = True
            self.conf_cfgs['rest_file'] = "\""+self.metaManager.instPath+"/archive/rest.nc\""
        else:
            self.conf_cfgs['rest'] = False
        if self.args['hist']:
            self.conf_cfgs['hist'] = True
            self.conf_cfgs['hist_file'] =  "\""+self.metaManager.instPath+"/archive/hist.nc\""
            #    print av['dst_av'].name
            #    print av['w_file']
        else:
            self.conf_cfgs['hist'] = False

    def codeGenerate(self):
        if self.parser == None:
            raise NotSetError('parser not set in InstCreator!!!')
        proc_cfgs = self.proc_cfgs
        merge_cfgs = self.merge_cfgs
        templateDirPrefix = "../template/"
        searchTmp = TempConfig(templateDirPrefix+'searchSet_Template.py', "search_set.py",\
                              {'models':proc_cfgs,'merge_cfgs':merge_cfgs})
        searchGen = CodeMapper([searchTmp])
        searchGen.genCode()
        from search_set import *
        deploy_cfgs = self.deploy_cfgs
        fieldVar_cfgs = self.fieldVar_cfgs
        field_cfgs = self.field_cfgs
        subrt_cfgs = self.subrt_cfgs
        merge_subroutines = self.merge_subroutines
        fraction_cfgs = self.fraction_cfgs
        fake_cfgs = self.fakeModel_cfgs 
        conf_cfgs = self.conf_cfgs
        manageTmp = TempConfig(templateDirPrefix+"procM_Template.F90", "manage.F90",{"proc_cfgs":proc_cfgs, "conf_cfgs":conf_cfgs})
        deployTmp = TempConfig(templateDirPrefix+"deploymod_Template.F90", "deploy_mod.F90",\
                              {'proc_cfgs':proc_cfgs,'deploy_cfgs':deploy_cfgs})
        timeDefTmp = TempConfig(templateDirPrefix+"timeDef_Template.F90","time_def.F90",{"proc_cfgs":proc_cfgs})
        timeCesmTmp = TempConfig(templateDirPrefix+"timeCesm_Template.F90", "timeCesm.F90", {"proc_cfgs":proc_cfgs})
        globalTmp  = TempConfig(templateDirPrefix+"globalVar_Template.F90","global_var.F90",{"proc_cfgs":proc_cfgs,\
                                                          "merge_cfgs":merge_cfgs,"fieldVar_cfgs":fieldVar_cfgs})
        fieldTmp = TempConfig(templateDirPrefix+"baseField_Template.F90","base_field.F90", {"field_cfgs":field_cfgs,\
                                                                          "fieldVar_cfgs":fieldVar_cfgs})
        baseHistTmp = TempConfig(templateDirPrefix+"baseHistMod_Template.F90","base_hist_mod.F90",{"proc_cfgs":proc_cfgs})
        baseRestTmp = TempConfig(templateDirPrefix+"baseRestMod_Template.F90","base_rest_mod.F90", {"proc_cfgs":proc_cfgs})
        for frac in fraction_cfgs:
            print fraction_cfgs[frac].init.name
        baseCplTmp = TempConfig(templateDirPrefix+"baseCpl_Template.F90","baseCpl.F90",\
                              {"proc_cfgs":proc_cfgs, "merge_subroutines":merge_subroutines,\
                               "merge_cfgs":merge_cfgs,"model_cfgs":model_cfgs, \
                               "subrt_cfgs":subrt_cfgs,'fraction_cfgs':fraction_cfgs,\
                               "conf_cfgs":conf_cfgs,"fake_cfgs":fake_cfgs})
        if self.args['regen']:
            confList = [searchTmp, manageTmp, deployTmp, baseCplTmp, globalTmp, timeDefTmp, timeCesmTmp, fieldTmp,\
                        baseHistTmp, baseRestTmp]
            codeGen = CodeMapper(confList)
            codeGen.genCode()
            # mv codeTo right place
            for key in self.metaManager.codeGenList:
                mvCmd = 'mv '+key+" "+self.metaManager.codePathDict[key].loc
                os.system(mvCmd)

    def createSrcConf(self):
        dataPath = self.metaManager.dataPath
        dataNml = self.metaManager.dataNml
        with open(dataNml, 'w') as f:
            for cfg in self.merge_cfgs:
                dst_info = self.merge_cfgs[cfg] ['dst']
                for av in dst_info:
                    sname = av['dst_mapper']
                    lname = av['w_file']
                    f.write('&mapperFile\n')
                    f.write('sname = \''+sname+'\'\n')
                    f.write('lname = '+lname+'\n')
                    f.write('/')

    def createPioNml(self):
        pioNml = self.metaManager.pioNml
        with open(pioNml, 'w') as f:
            f.write('&pio_default_inparm\n')
            f.write(' pio_async_interface = .false.\n')
            f.write(' pio_blocksize = -1\n')
            f.write(' pio_buffer_size_limit = -1\n')
            f.write(' pio_debug_level = 0\n')
            f.write(' pio_numiotasks = -1\n')
            f.write(' pio_root = 1\n')
            f.write(' pio_stride = -1\n')
            f.write(' pio_typename = \'netcdf\'\n')
            f.write('/\n')


    def createRcConf(self):
        dataPath = self.metaManager.dataPath
        datarc = self.metaManager.datarc
        with open(datarc, 'w') as f:
            for cfg in self.merge_cfgs:
                av = self.merge_cfgs[cfg]
                sname = av['mapperName']
                path = av['w_file']
                path = path[1:-1]
                path = self.metaManager.inputPath+"/map/"+path
                stype = sname+"_type"
                f.write(sname+'   '+path+'\n')
                f.write(stype+'    \'X\'\n')

    def createMakefile(self):
        # build prerequists libbcpl.a
        currDir = os.getcwd()
        os.chdir(InstCreator.couplerCodePath)
        cmdBuild = 'make'
        os.system(cmdBuild)
        os.chdir(currDir)
        # mv libbcpl.a to lib
        cmdMvObj = 'cp '+InstCreator.couplerCodePath+'/lib/* '+self.metaManager.instPath+'/lib'
        cmdMv = 'cp '+InstCreator.couplerCodePath+'/lib/libbcpl.a '+self.metaManager.instPath+'/lib'
        os.system(cmdMv)
        os.system(cmdMvObj)

        # mv required comp togather with its Makefile (may be modified) to models
        # model create but for component like CAM we should build its' namelist
	# and Makefile
        for model in self.proc_cfgs:
            name = model.name
            srcLocation = model.src
            
            # check model dir
            # first find the location in default path
            # then check whether srcLocation is a user
            # defined location
            codePath = InstCreator.couplerCodePath
            defaultPath = codePath+"/src/models/"
            modelDir = ""
            if os.path.exists(defaultPath+srcLocation):
                modelDir=defaultPath+srcLocation
            elif os.path.exists(srcLocation):
                modelDir=srcLocation
            else:
                raise WrongPathError("in createMakefile: {}".format(srcLocation))
            metaFile = model.metaFile
            if metaFile == "None":
                #modelDir = InstCreator.couplerCodePath+"/src/models/"+name
                cmdCpComp = 'cp '+modelDir+"/* "+self.metaManager.instPath+"/models/"+name  
                os.system(cmdCpComp)
            else:
                # perhaps we need some code to check metaFile position
                # if find metaFile or find it in the default search path
                # we need add a default search path
                modelCreator = ConfModel(name, metaFile, self.metaManager)
                modelCreator.createModelInst()
                #modelDir = InstCreator.couplerCodePath+"/src/models/"+name
                cmdCpComp = 'cp -r '+modelDir+"/* " + self.metaManager.instPath+"/models/"+name
                os.system(cmdCpComp)
                print cmdCpComp
                 
        # mv Cpl comp to models 
        cplDir = InstCreator.couplerCodePath+"/src/models/cpl"
        cmdCpCpl = 'cp '+cplDir+"/* "+self.metaManager.instPath+"/models/cpl"
        os.system(cmdCpCpl)

        # build Makefile from template
        #mkCompTmp = TempConfig('./mk/Makefile.build.comp', 'MakefileComp', {'proc_cfgs':self.proc_cfgs})      
        mkExeTmp = TempConfig('./mk/Makefile.build.exe','MakefileExe',{'proc_cfgs':self.proc_cfgs})
        mkConfTmp = TempConfig('./mk/Makefile.conf','Makefile.conf',{'meta_cfgs':self.metaManager})
        mkList = [mkExeTmp, mkConfTmp] 
        codeGen = CodeMapper(mkList) 
        codeGen.genCode()
        
        # mv Makefile 
        mvCompCmd = 'cp ./mk/Makefile.build.comp '+self.metaManager.instPath + "/Makefile"
        mvExeCmd = 'mv MakefileExe '+self.metaManager.instPath+"/models/cpl/Makefile"
        cpMkConfCmd = 'cp Makefile.conf '+self.metaManager.instPath+"/"
	mvMkConfCmd = 'mv Makefile.conf '+self.metaManager.instPath+"/models"
        os.system(mvCompCmd)
        os.system(mvExeCmd)
	os.system(cpMkConfCmd)
        os.system(mvMkConfCmd)
	#!cp scripts
	#cpBuildShCmd = 'cp ../instManager/instBuild.sh '+self.metaManager.instPath
        #os.system(cpBuildShCmd)
       
    def createDoc(self):
        docKV = {
           "case_name": "default name",
           "case_dir": "",
           "namelist":"",
           "case_desc":"no desc",
           "baseCplDir":""
           }
        currDir = os.getcwd()
        baseCplDir = currDir+"/../../baseCpl"
        os.chdir(baseCplDir)
        baseCplDir = os.getcwd()
        os.chdir(currDir)
        docKV["baseCplDir"] = baseCplDir

        with open("descCase", "w") as f:
            for k in docKV:
                s = k+":"+docKV[k]+"\n"
                f.write(s)

    def instCreate(self):
        if self.args["regen"]:
            self.getIr()
            self.codeGenerate()
        if not self.args["make"]:
            return 
        instPath = self.metaManager.instPath
        confPath = self.metaManager.confPath
        try:
            os.mkdir(instPath) 
        except:
            if self.args['overwrite']:
                rmCmd = 'rm -rf '+instPath
                os.system(rmCmd)
                os.mkdir(instPath)
            else:
                raise SrcExistError("instPath already exist")
        confPath= instPath+"/"+confPath
        srcPath = instPath+"/src"
        libPath = instPath+"/lib"
        includePath = instPath+"/include"
        binPath = instPath+"/bin"
        archPath = instPath+"/archive"
        scriptsPath = instPath+"/scripts"
        docPath = instPath+"/doc"
        os.mkdir(confPath)
        os.mkdir(srcPath)
        os.mkdir(libPath)
        os.mkdir(includePath)
        os.mkdir(binPath)
        os.mkdir(archPath)
        os.mkdir(scriptsPath)
        os.mkdir(docPath)
        print 'echo' 
        # create models dir & copy relavent code and Makefile
        modelsPath = instPath+"/models/"
        os.mkdir(modelsPath)
        for model in self.proc_cfgs:
            modelDir = modelsPath+model.name
            os.mkdir(modelDir)
        cplDir = modelsPath+"/cpl"
        os.mkdir(cplDir)
        
        # copy all sorts of conf file to conf dir
        copyNmlCmd = "mv "+self.metaManager.nmlfile+" "+confPath
        os.system(copyNmlCmd)

        #copy src conf file to src dir
        #self.createSrcConf()
        #copySrcConfCmd = "mv "+self.metaManager.dataNml+" "+srcPath
        #os.system(copySrcConfCmd)  
        #copy src conf file to src dir rc version
        self.createRcConf()
        copyRcConfCmd = "mv "+ self.metaManager.datarc+" "+srcPath
        os.system(copyRcConfCmd)

        self.createPioNml()
        copyPioCmd = "mv "+ self.metaManager.pioNml+" "+confPath
        os.system(copyPioCmd)

        #copy Makefile to relavent dir
        self.createMakefile()
        #exit(1)
  
        # create doc, mv it and cp scripts
        self.createDoc()
        cpDoc =  "cp descCase "+docPath
        os.system(cpDoc)

        # copy scripts
        cpScripts = "cp ./scripts/* "+scriptsPath
        os.system(cpScripts)
 
        #copy src include mod and lib .a .o to instDir
        BCGenPath = "../../baseCpl/"
        copyIncludeCmd = "cp -r " + BCGenPath+"include/* "+includePath
        copyLibCmd = "cp -r "+ BCGenPath+"lib/* "+libPath
        print copyIncludeCmd
        print copyLibCmd
        os.system(copyIncludeCmd)
        os.system(copyLibCmd)



if __name__ == "__main__":
    instParser = InstArgsParser()
    instParser.argSet()
    instParser.instCreate()
