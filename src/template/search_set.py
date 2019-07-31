import sys
sys.path.append('../ir')
sys.path.append('../parser')
from ir import ModelSubroutine
from codeWrapper import toString


class Temp:
    mix = False
    subroutine = []
    funcname = ""
    params = {
    
    }
    def __init__(self, funcname="", params="", mix=False, subroutine=[], strFmt=""):
        self.a = "333"
        self.subroutine = subroutine
        self.funcname = funcname
        self.params = params
        self.mix = mix
        self.space = 24*" "
        self.strFmt =  strFmt

    def getName(self):
        return "rr34"
  
    def getStrFormat(self):
	return 'call '+self.strFmt

    def getFuncFormat(self):
        res = []
        if self.mix:
            for routine in self.subroutine:
                res.append(routine.getFuncFormat())
        else:
            args = []
            l = len(self.params)
            indx = 0
            for key in sorted(self.params):
                indx = indx+1
                item = key + '=' + self.params[key] +'&\n'
                if key == 'rList':
                    item = key + '=\'' + self.params[key]+ '\'&\n' 
                if indx == l:
                    item = key + '=' + self.params[key]
                args.append(str(item))
            args = (self.space+",").join(args)
            func_str = "call "+ self.funcname + "(" + args +")"

            res.append(func_str)
        return "\n".join(res)

method_name = 'ocn_init_mct'
params = {
        'my_proc':'my_proc', 
        'ID':'my_proc%modelocn_id',
        'EClock':'EClock',
        'gsMap_ocnocn':'gsMap_ocnocn', 
        'ocn2x_ocnocn':'ocn2x_ocnocn', 
        'x2ocn_ocnocn':'x2ocn_ocnocn', 
        'ierr':'ierr'
    }
ocn_init = Temp(funcname=method_name, params=params, strFmt='ocn_init_mct(metaData%ocn, EClock_ocn, x2ocn_ocnocn, ocn2x_ocnocn, ierr=ierr)')

method_name = 'atm_init_mct'
params = {
        'my_proc':'my_proc', 
        'ID':'my_proc%modelatm_id',
        'EClock':'EClock',
        'gsMap_atmatm':'gsMap_atmatm', 
        'atm02x_atm0atm0':'atm02x_atm0atm0', 
        'x2atm0_atm0atm0':'x2atm0_atm0atm0', 
        'ierr':'ierr'
    }
atm_init = Temp(funcname=method_name, params=params, strFmt='atm_init_mct(metaData%atm0, EClock_atm0, x2atm0_atm0atm0, atm02x_atm0atm0, ierr=ierr)')

method_name = 'atm_init_mct'
params = {
        'my_proc':'my_proc', 
        'ID':'my_proc%modelatm_id',
        'EClock':'EClock',
        'gsMap_atmatm':'gsMap_atmatm', 
        'atm02x_atm0atm0':'atm02x_atm0atm0', 
        'x2atm0_atm0atm0':'x2atm0_atm0atm0', 
        'ierr':'ierr'
    }
atm_init = Temp(funcname=method_name, params=params, strFmt='atm_init_mct(metaData%atm0, EClock_atm0, x2atm0_atm0atm0, atm02x_atm0atm0, ierr=ierr)')

method_name = 'ice_init_mct'
params = {
        'my_proc':'my_proc', 
        'ID':'my_proc%modelice_id',
        'EClock':'EClock',
        'gsMap_iceice':'gsMap_iceice', 
        'ice2x_iceice':'ice2x_iceice', 
        'x2ice_iceice':'x2ice_iceice', 
        'ierr':'ierr'
    }
ice_init = Temp(funcname=method_name, params=params, strFmt='ice_init_mct(metaData%ice, EClock_ice, x2ice_iceice, ice2x_iceice, ierr=ierr)')

method_name = 'rof_init_mct'
params = {
        'my_proc':'my_proc', 
        'ID':'my_proc%modelrof_id',
        'EClock':'EClock',
        'gsMap_rofrof':'gsMap_rofrof', 
        'rof2x_rofrof':'rof2x_rofrof', 
        'x2rof_rofrof':'x2rof_rofrof', 
        'ierr':'ierr'
    }
rof_init = Temp(funcname=method_name, params=params, strFmt='rof_init_mct(metaData%rof, EClock_rof, x2rof_rofrof, rof2x_rofrof, ierr=ierr)')

method_name = 'lnd_init_mct'
params = {
        'my_proc':'my_proc', 
        'ID':'my_proc%modellnd_id',
        'EClock':'EClock',
        'gsMap_lndlnd':'gsMap_lndlnd', 
        'lnd02x_lnd0lnd0':'lnd02x_lnd0lnd0', 
        'x2lnd0_lnd0lnd0':'x2lnd0_lnd0lnd0', 
        'ierr':'ierr'
    }
lnd_init = Temp(funcname=method_name, params=params, strFmt='lnd_init_mct(metaData%lnd0, EClock_lnd0, x2lnd0_lnd0lnd0, lnd02x_lnd0lnd0, ierr=ierr)')

method_name = 'lnd_init_mct'
params = {
        'my_proc':'my_proc', 
        'ID':'my_proc%modellnd_id',
        'EClock':'EClock',
        'gsMap_lndlnd':'gsMap_lndlnd', 
        'lnd02x_lnd0lnd0':'lnd02x_lnd0lnd0', 
        'x2lnd0_lnd0lnd0':'x2lnd0_lnd0lnd0', 
        'ierr':'ierr'
    }
lnd_init = Temp(funcname=method_name, params=params, strFmt='lnd_init_mct(metaData%lnd0, EClock_lnd0, x2lnd0_lnd0lnd0, lnd02x_lnd0lnd0, ierr=ierr)')


method_name='mapper_comp_map'
params = {
    'mapper':'my_proc%Mapper_Cx2ocn',
    'src':'x2ocn_ocnx',
    'dst':'x2ocn_ocnocn', 
    'msgtag':'100+00+2', 
    'ierr':'ierr',
}
ocn_run_phase1 = Temp(funcname=method_name, params=params)

method_name = 'ocn_run_mct'
params = {
    'my_proc':'my_proc',
    'ID':'my_proc%modelocn_id',
    'EClock':'EClock', 
    'ocn2x':'ocn2x_ocnocn', 
    'x2ocn':'x2ocn_ocnocn',
    'ierr':'ierr'
}
ocn_run_phase2 = Temp(funcname=method_name, params=params)

sub_run_phase_3 = []
method_name = 'mapper_comp_map'
params = {
    'mapper':'my_proc%Mapper_Cocn2x',
    'src':'ocn2x_ocnocn',
    'dst':'ocn2x_ocnx', 
    'msgtag':'100+00+3', 
    'ierr':'ierr',
}
ocn_run_phase3_1 = Temp(funcname=method_name, params=params)
sub_run_phase_3.append(ocn_run_phase3_1)





ocn_run_phase3 = Temp(subroutine=sub_run_phase_3,
             mix=True)
sub_run_phase_3 = []
method_name='mapper_comp_map'
params = {
    'mapper':'my_proc%Mapper_Cx2atm0',
    'src':'x2atm0_atm0x',
    'dst':'x2atm0_atm0atm0', 
    'msgtag':'100+10+2', 
    'ierr':'ierr',
}
atm_run_phase1 = Temp(funcname=method_name, params=params)

method_name = 'atm_run_mct'
params = {
    'my_proc':'my_proc',
    'ID':'my_proc%modelatm_id',
    'EClock':'EClock', 
    'atm2x':'atm02x_atm0atm0', 
    'x2atm':'x2atm0_atm0atm0',
    'ierr':'ierr'
}
atm_run_phase2 = Temp(funcname=method_name, params=params)

sub_run_phase_3 = []
method_name = 'mapper_comp_map'
params = {
    'mapper':'my_proc%Mapper_Catm02x',
    'src':'atm02x_atm0atm0',
    'dst':'atm02x_atm0x', 
    'msgtag':'100+10+3', 
    'ierr':'ierr',
}
atm_run_phase3_1 = Temp(funcname=method_name, params=params)
sub_run_phase_3.append(atm_run_phase3_1)





atm_run_phase3 = Temp(subroutine=sub_run_phase_3,
             mix=True)
sub_run_phase_3 = []
method_name='mapper_comp_map'
params = {
    'mapper':'my_proc%Mapper_Cx2atm0',
    'src':'x2atm0_atm0x',
    'dst':'x2atm0_atm0atm0', 
    'msgtag':'100+20+2', 
    'ierr':'ierr',
}
atm_run_phase1 = Temp(funcname=method_name, params=params)

method_name = 'atm_run_mct'
params = {
    'my_proc':'my_proc',
    'ID':'my_proc%modelatm_id',
    'EClock':'EClock', 
    'atm2x':'atm02x_atm0atm0', 
    'x2atm':'x2atm0_atm0atm0',
    'ierr':'ierr'
}
atm_run_phase2 = Temp(funcname=method_name, params=params)

sub_run_phase_3 = []
method_name = 'mapper_comp_map'
params = {
    'mapper':'my_proc%Mapper_Catm02x',
    'src':'atm02x_atm0atm0',
    'dst':'atm02x_atm0x', 
    'msgtag':'100+20+3', 
    'ierr':'ierr',
}
atm_run_phase3_1 = Temp(funcname=method_name, params=params)
sub_run_phase_3.append(atm_run_phase3_1)





atm_run_phase3 = Temp(subroutine=sub_run_phase_3,
             mix=True)
sub_run_phase_3 = []
method_name='mapper_comp_map'
params = {
    'mapper':'my_proc%Mapper_Cx2ice',
    'src':'x2ice_icex',
    'dst':'x2ice_iceice', 
    'msgtag':'100+30+2', 
    'ierr':'ierr',
}
ice_run_phase1 = Temp(funcname=method_name, params=params)

method_name = 'ice_run_mct'
params = {
    'my_proc':'my_proc',
    'ID':'my_proc%modelice_id',
    'EClock':'EClock', 
    'ice2x':'ice2x_iceice', 
    'x2ice':'x2ice_iceice',
    'ierr':'ierr'
}
ice_run_phase2 = Temp(funcname=method_name, params=params)

sub_run_phase_3 = []
method_name = 'mapper_comp_map'
params = {
    'mapper':'my_proc%Mapper_Cice2x',
    'src':'ice2x_iceice',
    'dst':'ice2x_icex', 
    'msgtag':'100+30+3', 
    'ierr':'ierr',
}
ice_run_phase3_1 = Temp(funcname=method_name, params=params)
sub_run_phase_3.append(ice_run_phase3_1)





ice_run_phase3 = Temp(subroutine=sub_run_phase_3,
             mix=True)
sub_run_phase_3 = []
method_name='mapper_comp_map'
params = {
    'mapper':'my_proc%Mapper_Cx2rof',
    'src':'x2rof_rofx',
    'dst':'x2rof_rofrof', 
    'msgtag':'100+40+2', 
    'ierr':'ierr',
}
rof_run_phase1 = Temp(funcname=method_name, params=params)

method_name = 'rof_run_mct'
params = {
    'my_proc':'my_proc',
    'ID':'my_proc%modelrof_id',
    'EClock':'EClock', 
    'rof2x':'rof2x_rofrof', 
    'x2rof':'x2rof_rofrof',
    'ierr':'ierr'
}
rof_run_phase2 = Temp(funcname=method_name, params=params)

sub_run_phase_3 = []
method_name = 'mapper_comp_map'
params = {
    'mapper':'my_proc%Mapper_Crof2x',
    'src':'rof2x_rofrof',
    'dst':'rof2x_rofx', 
    'msgtag':'100+40+3', 
    'ierr':'ierr',
}
rof_run_phase3_1 = Temp(funcname=method_name, params=params)
sub_run_phase_3.append(rof_run_phase3_1)





rof_run_phase3 = Temp(subroutine=sub_run_phase_3,
             mix=True)
sub_run_phase_3 = []
method_name='mapper_comp_map'
params = {
    'mapper':'my_proc%Mapper_Cx2lnd0',
    'src':'x2lnd0_lnd0x',
    'dst':'x2lnd0_lnd0lnd0', 
    'msgtag':'100+50+2', 
    'ierr':'ierr',
}
lnd_run_phase1 = Temp(funcname=method_name, params=params)

method_name = 'lnd_run_mct'
params = {
    'my_proc':'my_proc',
    'ID':'my_proc%modellnd_id',
    'EClock':'EClock', 
    'lnd2x':'lnd02x_lnd0lnd0', 
    'x2lnd':'x2lnd0_lnd0lnd0',
    'ierr':'ierr'
}
lnd_run_phase2 = Temp(funcname=method_name, params=params)

sub_run_phase_3 = []
method_name = 'mapper_comp_map'
params = {
    'mapper':'my_proc%Mapper_Clnd02x',
    'src':'lnd02x_lnd0lnd0',
    'dst':'lnd02x_lnd0x', 
    'msgtag':'100+50+3', 
    'ierr':'ierr',
}
lnd_run_phase3_1 = Temp(funcname=method_name, params=params)
sub_run_phase_3.append(lnd_run_phase3_1)





lnd_run_phase3 = Temp(subroutine=sub_run_phase_3,
             mix=True)
sub_run_phase_3 = []
method_name='mapper_comp_map'
params = {
    'mapper':'my_proc%Mapper_Cx2lnd0',
    'src':'x2lnd0_lnd0x',
    'dst':'x2lnd0_lnd0lnd0', 
    'msgtag':'100+60+2', 
    'ierr':'ierr',
}
lnd_run_phase1 = Temp(funcname=method_name, params=params)

method_name = 'lnd_run_mct'
params = {
    'my_proc':'my_proc',
    'ID':'my_proc%modellnd_id',
    'EClock':'EClock', 
    'lnd2x':'lnd02x_lnd0lnd0', 
    'x2lnd':'x2lnd0_lnd0lnd0',
    'ierr':'ierr'
}
lnd_run_phase2 = Temp(funcname=method_name, params=params)

sub_run_phase_3 = []
method_name = 'mapper_comp_map'
params = {
    'mapper':'my_proc%Mapper_Clnd02x',
    'src':'lnd02x_lnd0lnd0',
    'dst':'lnd02x_lnd0x', 
    'msgtag':'100+60+3', 
    'ierr':'ierr',
}
lnd_run_phase3_1 = Temp(funcname=method_name, params=params)
sub_run_phase_3.append(lnd_run_phase3_1)





lnd_run_phase3 = Temp(subroutine=sub_run_phase_3,
             mix=True)
sub_run_phase_3 = []



model_ocn_cfg = { # Model M's cfg
'model_unique_name': 'ocn',
'model_unique_id': '1',
    'mx_av_set' : { # Av between model M and Cpl
        'mx_mm':{
            'name': 'ocn2x_ocnocn',
        },
        'mx_mx':{
            'name': 'ocn2x_ocnx',
        },   
        'xm_mm':{
            'name': 'x2ocn_ocnocn',
        },   
        'xm_mx':{
            'name': 'x2ocn_ocnx',
        }   
    },

    'mn_av_set': [ # Av between Model M and Model N

    ],


    'mx_gsmap_set':  { # gsMap of Model M
        'mx': {
            'name':'gsMap_ocnx'
        },
        'mm': {
            'name':'gsMap_ocnocn'
        }
    },

    'domain':{
        'mm':'domain_ocnocn',
        'mx':'domain_ocnx'
     },    

    'subroutine': {
        'init_method': ocn_init,
        'run_method': {
            'run_phase1_method': ocn_run_phase1,
            'run_phase2_method': ocn_run_phase2,
            'run_phase3_method': ocn_run_phase3,
        },
        'final_method':[
            {
                'method_name':'ocn_final_mct',
                'params':{
                }
            }
        ]
    }

}

model_atm_cfg = { # Model M's cfg
'model_unique_name': 'atm',
'model_unique_id': '2',
    'mx_av_set' : { # Av between model M and Cpl
        'mx_mm':{
            'name': 'atm02x_atm0atm0',
        },
        'mx_mx':{
            'name': 'atm02x_atm0x',
        },   
        'xm_mm':{
            'name': 'x2atm0_atm0atm0',
        },   
        'xm_mx':{
            'name': 'x2atm0_atm0x',
        }   
    },

    'mn_av_set': [ # Av between Model M and Model N

    ],


    'mx_gsmap_set':  { # gsMap of Model M
        'mx': {
            'name':'gsMap_atm0x'
        },
        'mm': {
            'name':'gsMap_atm0atm0'
        }
    },

    'domain':{
        'mm':'domain_atm0atm0',
        'mx':'domain_atm0x'
     },    

    'subroutine': {
        'init_method': atm_init,
        'run_method': {
            'run_phase1_method': atm_run_phase1,
            'run_phase2_method': atm_run_phase2,
            'run_phase3_method': atm_run_phase3,
        },
        'final_method':[
            {
                'method_name':'atm_final_mct',
                'params':{
                }
            }
        ]
    }

}

model_atm_cfg = { # Model M's cfg
'model_unique_name': 'atm',
'model_unique_id': '2',
    'mx_av_set' : { # Av between model M and Cpl
        'mx_mm':{
            'name': 'atm02x_atm0atm0',
        },
        'mx_mx':{
            'name': 'atm02x_atm0x',
        },   
        'xm_mm':{
            'name': 'x2atm0_atm0atm0',
        },   
        'xm_mx':{
            'name': 'x2atm0_atm0x',
        }   
    },

    'mn_av_set': [ # Av between Model M and Model N

    ],


    'mx_gsmap_set':  { # gsMap of Model M
        'mx': {
            'name':'gsMap_atm0x'
        },
        'mm': {
            'name':'gsMap_atm0atm0'
        }
    },

    'domain':{
        'mm':'domain_atm0atm0',
        'mx':'domain_atm0x'
     },    

    'subroutine': {
        'init_method': atm_init,
        'run_method': {
            'run_phase1_method': atm_run_phase1,
            'run_phase2_method': atm_run_phase2,
            'run_phase3_method': atm_run_phase3,
        },
        'final_method':[
            {
                'method_name':'atm_final_mct',
                'params':{
                }
            }
        ]
    }

}

model_ice_cfg = { # Model M's cfg
'model_unique_name': 'ice',
'model_unique_id': '4',
    'mx_av_set' : { # Av between model M and Cpl
        'mx_mm':{
            'name': 'ice2x_iceice',
        },
        'mx_mx':{
            'name': 'ice2x_icex',
        },   
        'xm_mm':{
            'name': 'x2ice_iceice',
        },   
        'xm_mx':{
            'name': 'x2ice_icex',
        }   
    },

    'mn_av_set': [ # Av between Model M and Model N

    ],


    'mx_gsmap_set':  { # gsMap of Model M
        'mx': {
            'name':'gsMap_icex'
        },
        'mm': {
            'name':'gsMap_iceice'
        }
    },

    'domain':{
        'mm':'domain_iceice',
        'mx':'domain_icex'
     },    

    'subroutine': {
        'init_method': ice_init,
        'run_method': {
            'run_phase1_method': ice_run_phase1,
            'run_phase2_method': ice_run_phase2,
            'run_phase3_method': ice_run_phase3,
        },
        'final_method':[
            {
                'method_name':'ice_final_mct',
                'params':{
                }
            }
        ]
    }

}

model_rof_cfg = { # Model M's cfg
'model_unique_name': 'rof',
'model_unique_id': '5',
    'mx_av_set' : { # Av between model M and Cpl
        'mx_mm':{
            'name': 'rof2x_rofrof',
        },
        'mx_mx':{
            'name': 'rof2x_rofx',
        },   
        'xm_mm':{
            'name': 'x2rof_rofrof',
        },   
        'xm_mx':{
            'name': 'x2rof_rofx',
        }   
    },

    'mn_av_set': [ # Av between Model M and Model N

    ],


    'mx_gsmap_set':  { # gsMap of Model M
        'mx': {
            'name':'gsMap_rofx'
        },
        'mm': {
            'name':'gsMap_rofrof'
        }
    },

    'domain':{
        'mm':'domain_rofrof',
        'mx':'domain_rofx'
     },    

    'subroutine': {
        'init_method': rof_init,
        'run_method': {
            'run_phase1_method': rof_run_phase1,
            'run_phase2_method': rof_run_phase2,
            'run_phase3_method': rof_run_phase3,
        },
        'final_method':[
            {
                'method_name':'rof_final_mct',
                'params':{
                }
            }
        ]
    }

}

model_lnd_cfg = { # Model M's cfg
'model_unique_name': 'lnd',
'model_unique_id': '3',
    'mx_av_set' : { # Av between model M and Cpl
        'mx_mm':{
            'name': 'lnd02x_lnd0lnd0',
        },
        'mx_mx':{
            'name': 'lnd02x_lnd0x',
        },   
        'xm_mm':{
            'name': 'x2lnd0_lnd0lnd0',
        },   
        'xm_mx':{
            'name': 'x2lnd0_lnd0x',
        }   
    },

    'mn_av_set': [ # Av between Model M and Model N

    ],


    'mx_gsmap_set':  { # gsMap of Model M
        'mx': {
            'name':'gsMap_lnd0x'
        },
        'mm': {
            'name':'gsMap_lnd0lnd0'
        }
    },

    'domain':{
        'mm':'domain_lnd0lnd0',
        'mx':'domain_lnd0x'
     },    

    'subroutine': {
        'init_method': lnd_init,
        'run_method': {
            'run_phase1_method': lnd_run_phase1,
            'run_phase2_method': lnd_run_phase2,
            'run_phase3_method': lnd_run_phase3,
        },
        'final_method':[
            {
                'method_name':'lnd_final_mct',
                'params':{
                }
            }
        ]
    }

}

model_lnd_cfg = { # Model M's cfg
'model_unique_name': 'lnd',
'model_unique_id': '3',
    'mx_av_set' : { # Av between model M and Cpl
        'mx_mm':{
            'name': 'lnd02x_lnd0lnd0',
        },
        'mx_mx':{
            'name': 'lnd02x_lnd0x',
        },   
        'xm_mm':{
            'name': 'x2lnd0_lnd0lnd0',
        },   
        'xm_mx':{
            'name': 'x2lnd0_lnd0x',
        }   
    },

    'mn_av_set': [ # Av between Model M and Model N

    ],


    'mx_gsmap_set':  { # gsMap of Model M
        'mx': {
            'name':'gsMap_lnd0x'
        },
        'mm': {
            'name':'gsMap_lnd0lnd0'
        }
    },

    'domain':{
        'mm':'domain_lnd0lnd0',
        'mx':'domain_lnd0x'
     },    

    'subroutine': {
        'init_method': lnd_init,
        'run_method': {
            'run_phase1_method': lnd_run_phase1,
            'run_phase2_method': lnd_run_phase2,
            'run_phase3_method': lnd_run_phase3,
        },
        'final_method':[
            {
                'method_name':'lnd_final_mct',
                'params':{
                }
            }
        ]
    }

}


model_cfgs = {
    "ocn":model_ocn_cfg,
    "atm":model_atm_cfg,
    "atm":model_atm_cfg,
    "ice":model_ice_cfg,
    "rof":model_rof_cfg,
    "lnd":model_lnd_cfg,
    "lnd":model_lnd_cfg,
}


