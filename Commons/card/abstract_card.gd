extends Control
class_name AbstractCard

@export var base_color : ColorRect
@export var title_label : RichTextLabel
@export var id_label : RichTextLabel
var _id : int


func set_title_text(title : String) -> void:
	title_label.text = title
func set_id_text(new_id : int) -> void:
	id_label.text = "ID: " + str(new_id)
