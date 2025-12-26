extends Control
class_name AbstractCard

@export var base_color_rect : ColorRect
@export var title_label : RichTextLabel
@export var id_label : RichTextLabel
@export var card_form : CardForm

func _ready() -> void:
	base_color_rect.color = card_form._base_color
	set_id_text(card_form._id)
	set_title_text(card_form._title)

func set_title_text(title : String) -> void:
	title_label.text = title
func set_id_text(new_id : int) -> void:
	id_label.text = "ID: " + str(new_id)
