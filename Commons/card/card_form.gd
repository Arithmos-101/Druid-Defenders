extends Resource
class_name CardForm

@export_group("Metadata")
@export var id : int
@export_group("Text")
@export var title : String
@export_multiline var description : String
@export_group("Visuals")
@export var base_color :=  Color("969696")
@export var image : Texture2D
