# Documentation of IntermediateRepresentation

## classes in summary
There are two parents classes, others are derived from them: Subroutine and CoupleEntity. MergSubroutine and ModelSubroutine are basic requirements for users to define in XML. As for CoupleEntity, AttrVect, GsMap, Mapper, sMat(may be delete in a new version), Model. These CoupleEntity represent some infomation that is neccesary for couple. And Model shall have some attributes to include its relevant variables. More details shall be placed below.
## Subroutine class
### parent class Subroutine
Subroutine class is a class describe subroutine
```
Subroutine attributes: __subroutineName, name of this subroutine
                       __argList, list of subroutine list
                       __lineCharacter, how much character in one line
```
Subroutine methods
```
def append(arg): append an argment to __argList
def toString(): transform the instance to a string
```
### derived class MergSubroutine
MergSubroutine class is a class describe merg subroutine.The merg subroutine get dst attrVect and src attrVect, then use a given Mapper to mrg src attrVect to dst attrVect.
```
MergSubroutine attrbutes : __subroutineName
                           __argList
                           __lineCharacter
```
MergSubroutine methods
```

```
### derived class ModelSubroutine
ModelSubroutine class is a class describe model subroutine. In our definition, a model subroutine is a set of subroutine provided by component developers including model_init, model_run, model_final etc.
```
ModelSubroutine attributes: __name : name of this model
                            __subroutineName: the name of ModelSubroutine
                            __argList: list of the ModelSubroutine
                            default: the pattern of name generation: True by model name, False use user defined __subroutineName
                            __wrapper: the API used by this subroutine, now MCT
```
ModelSubroutine methods
```

```
## CoupleEntity class
### parent class CoupleEntity
<<<<<<< HEAD
CoupleEntity class is a class describe the entities used in couple procedure, these entities include attrVect, mapper, model, gsmap and so on. Typically, CoupleEntity class only define as less attributes as possible.Another important thing is that every CoupleEntity needs to bind to a NameManager in case that no instance of a class will have the same name.
```
CoupleEntity attrbutes: __name: the name of the Entity
                        __type: the type of the Entity (Model, Mapper, AttrVect)
                        __bind: has been bind to manager or not
```
CoupleEntity methods
```
def BindToManager(manager): bind this Entity to NameManager
properties:
          type, name
```
CoupleEntity class implement some basic attribute and methods for Couple Entities and bound the behavior of Model, Mapper, etc

```
CoupleEntity attributes:self.__name : the name of this entity
                        self.__type : the type of this entity, used for check which func to call
                        self.__bind : whether this entity has bind to NameManager, if not, its                           name is not legal
```

CoupleEntity methods

```
def BindToManager(self,manager): bind this entity to a NameManager
```

### derived class Model
The Model class

Model class describe the model. Model is a combination of model subroutine, relavent couple entities like attrVect.

```
Model attributes: self.__model_init : model init subroutine
       		      self.__model_run : model run subroutine
       		      self.__model_final : model final subroutine
       		      self.__attrVects : relevant attrVect, which only used for trans between                          coupler and used in model subroutine
       		      self.__gsMaps : relevant gsMap
       		      self.__mappers : relevant mappers, only the mapper_Cs are included
```

Model class methods

```
def append(self, obj): append obj to relevant obj list,(for example, attrVect to self.__attrVects)
```

### derived class AttrVect

attrVect class describe the attrVect. In our grammer attrVects have two forms: inside component attrVects, exchange atrrVects. The first one is described by models.xml, another is described by the coupler.xml.
```
AttrVect attributes: self.__field: attrVect fields
                     self.__name : user defined attrVect Name
                     self.__nx : size in x axis
                     self.__ny : size in y axis
                     self.__src : src component
                     self.__dst : dst component
                     self.__grid : grid __type
                     self.__pes : where this attrVect located
```
properties of AttrVect class
```
def field(self)
def src(self)
def dst(self)
def grid(self)
def pes(self)
def atype(self)
```
### derived class Mapper
Mapper class describe mappers. Mappers are used to describe an Entity which transform data from pes set to pes set. Nomatter the two pes sets are unique, of different process set or even those describe different grid pes set.
```
Mapper attrbutes:self_name : user defined mapper name(may be discard in new version)
                 self.__mapType: the type of mapper, "copy", "rearr", "spmat"
                 self.__src : src pes set
                 self.__dst : dst pes set
```  
properties of Mapper class
```
def src(self)
def mapType(self)
def dst(self)
```
### derived class GsMap
GsMap class describe gsmap. Gsmap describes how an attrVect is distributed among many processes.
```
GsMap attrbutes: self.__grid : describe the grid of gsMap
                 self.__pes : describe where the attrVect located
```
properties of GsMap
```
def grid(self)
def pes(self)
```
