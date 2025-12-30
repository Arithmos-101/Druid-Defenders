extends Node2D
class_name Card

signal card_pressed(card : Card)

@export var size := Vector2(540, 720)
@export var base_color_rect : ColorRect
@export var title_label : RichTextLabel
@export var description_label : RichTextLabel
@export var id_label : RichTextLabel
@export var image_rect : TextureRect
@export var card_form : CardForm
var is_hovering := false
var time := 0.0


func _ready() -> void:
	set_base_color(card_form.base_color)
	set_id_text(card_form.id)
	set_title_text(card_form.title)
	set_description_text(card_form.description)
	set_image(card_form.image)


func set_base_color(color : Color) -> void:
	base_color_rect.color = color
func set_title_text(title : String) -> void:
	title_label.text = title
func set_description_text(description : String) -> void:
	description_label.text = description
func set_id_text(new_id : int) -> void:
	id_label.text = "ID: " + str(new_id)
func set_image(image : Texture) -> void:
	image_rect.texture = image


func _on_mouse_sensor_mouse_entered() -> void:
	is_hovering = true

func _on_mouse_sensor_mouse_exited() -> void:
	is_hovering = false

func _on_mouse_sensor_pressed() -> void:
	emit_signal("card_pressed", self)
