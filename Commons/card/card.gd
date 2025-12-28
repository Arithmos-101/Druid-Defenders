extends Node2D
class_name Card

enum CardContainer {
	DEFAULT,
	HAND,
	DRAW,
	DISCARD
}

const HOVER_SCALE = Vector2(1.2,1.2)
const SLIDE_UP_DISTANCE = Vector2(0, 20)
const VECTOR2_ERROR = Vector2(0.005,0.005)
@export var base_color_rect : ColorRect
@export var title_label : RichTextLabel
@export var id_label : RichTextLabel
@export var image_rect : TextureRect
@export var card_form : CardForm
var is_hovering := false
var current_container : CardContainer

var _starting_scale : Vector2
var _ending_scale : Vector2
var _starting_position : Vector2
var _ending_position : Vector2
var _time := 0.0

func _ready() -> void:
	set_base_color(card_form.base_color)
	set_id_text(card_form.id)
	set_title_text(card_form.title)
	set_image(card_form.image)
	_starting_scale = scale
	_ending_scale = scale * HOVER_SCALE
	_starting_position = position
	_ending_position = _starting_position - SLIDE_UP_DISTANCE

func set_base_color(color : Color) -> void:
	base_color_rect.color = color
func set_title_text(title : String) -> void:
	title_label.text = title
func set_id_text(new_id : int) -> void:
	id_label.text = "ID: " + str(new_id)
func set_image(image : Texture) -> void:
	image_rect.texture = image

func _process(delta: float) -> void:
	card_focus(delta)

func card_focus(delta: float) -> void:
	match current_container:
		CardContainer.HAND:
			card_hover(delta)
		CardContainer.DRAW:
			print(position)
			card_slide_up(delta)
		CardContainer.DEFAULT:
			pass

func card_hover(delta: float) -> void:
	if is_hovering:
		_time = clamp(_time + delta, 0.0, 1.0)
		scale = lerp(_starting_scale, _ending_scale, ease(_time, 0.08))
	else:
		_time = 0
		scale = _starting_scale

func card_slide_up(delta: float) -> void:
	if is_hovering:
		_time = clamp(_time + delta, 0.0, 1.0)
		position = lerp(_starting_position, _ending_position, ease(_time, 0.08))
	else:
		_time = 0
		position = _starting_position

func _on_mouse_sensor_mouse_entered() -> void:
	is_hovering = true

func _on_mouse_sensor_mouse_exited() -> void:
	is_hovering = false
