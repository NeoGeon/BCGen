from codeGen import codeGenerator
import sys
sys.path.append('../parser')
from parserMod import Parser

parser = Parser()
parser.parse()

proc_cfgs = [
    parser.models[m] for m in parser.models 
]

merge_subroutines = [
    parser.subroutine[m] for m in parser.subroutine
]
subrt_cfgs = []
for list_ in parser.runSubroutine:
    for node in list_:
        subrt_cfgs.append(node.data.strFormat)

fraction_cfgs = parser.fractions
deploy_cfgs = parser.deploy
#print(type(deploy_cfgs))
#print(len(deploy_cfgs))
#print(deploy_cfgs)

def get_SMat_relation(attrVects):
    model_names = []
    model_SMats = {}
    #print attrVects

    for av in attrVects:
        # todo get dst_av_model 
        dst_model = attrVects[av][0].dstModel
        model_name = dst_model.name
        model_gsmap_name = attrVects[av][0].srcModel.gsMaps['cpl'].name
        model_SMats[model_name] = {}
        model_SMats[model_name]['src'] = av
        model_SMats[model_name]['dst'] = []
        model_SMats[model_name]['gm'] = model_gsmap_name
        model_names.append(model_name)

    for av in attrVects:
        for src_x_dst_x_av in attrVects[av]:
            src_model = src_x_dst_x_av.srcModel
            dst_model = src_x_dst_x_av.dstModel
            src_model_name = src_model.name
            dst_model_name = dst_model.name
            model_gsmap_name = src_model.gsMaps['cpl'].name
            dst_gsmap_name = dst_model.gsMaps['cpl'].name
            dst_field = src_x_dst_x_av.field
            #print(av, dst_model_name, src_x_dst_x_av.name,\
            #        src_x_dst_x_av.mapperName)
            dst_info = {
                'dst_model_name':dst_model_name,
                'dst_av':src_x_dst_x_av,
                'dst_gm': dst_gsmap_name,
                'dst_mapper':src_x_dst_x_av.mapperName,
                'dst_field':dst_field,
                # todo set dst_sparse_len
                'smat_size':3
                    }
            if src_model_name not in model_SMats:
                model_SMats[src_model_name]={}
                model_SMats[src_model_name]['src']=src_x_dst_x_av.srcName
                model_SMats[src_model_name]['dst']=[]
                model_gsmap_name=dst_model.gsMaps['cpl'].name
                model_SMats[src_model_name]['gm']=model_gsmap_name
            model_SMats[src_model_name]['dst'].append(dst_info)
    return model_SMats

merge_cfgs = get_SMat_relation(parser.attrVectCouple)
print' merge:', merge_cfgs
code = codeGenerator("searchSet_Template.py", "search_set.py")
code.addList('models',proc_cfgs)
code.addList('merge_cfgs',merge_cfgs)
code.generate()



from search_set import *
print 'vnn'
code = codeGenerator("procM_Template.F90", "manage.F90")

#TODO add 
code = codeGenerator("deploymod_Template.F90", "deploy_mod.F90")
code.addList('proc_cfgs',proc_cfgs)
code.addList('deploy_cfgs',deploy_cfgs)
#print(deploy_cfgs)
code.generate()
code = codeGenerator("procM_Template.F90", "manage.F90")
code.addList('proc_cfgs',proc_cfgs)
code.generate()

code = codeGenerator("procDef_Template.F90", "proc_def.F90")
code.addList('proc_cfgs',proc_cfgs)
code.addList('merge_cfgs',merge_cfgs)
code.generate()

code = codeGenerator("timeM_Template.F90", "timeM.F90")
code.addList('proc_cfgs',proc_cfgs)
code.generate()
print 'time'

#TODO
code = codeGenerator("baseCpl_Template.F90", "baseCpl.F90")
code.addList('proc_cfgs',proc_cfgs)
code.addList('merge_subroutines', merge_subroutines)
code.addList('merge_cfgs',merge_cfgs)
code.addList('model_cfgs',model_cfgs)
code.addList('fraction_cfgs',fraction_cfgs)
code.addList('subrt_cfgs', subrt_cfgs)
code.generate()
