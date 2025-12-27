extends Node2D
class_name Card

const HOVER_SCALE = Vector2(1.2,1.2)
const HOVER_ZOOM_SPEED = 4.0
@export var base_color_rect : ColorRect
@export var title_label : RichTextLabel
@export var id_label : RichTextLabel
@export var card_form : CardForm
var is_hovering := false

var _starting_scale : Vector2
var _ending_scale : Vector2
var _time := 0.0

func _ready() -> void:
	set_base_color(card_form.base_color)
	set_id_text(card_form.id)
	set_title_text(card_form.title)
	_starting_scale = scale
	_ending_scale = scale * HOVER_SCALE

func set_base_color(color : Color) -> void:
	base_color_rect.color = color
func set_title_text(title : String) -> void:
	title_label.text = title
func set_id_text(new_id : int) -> void:
	id_label.text = "ID: " + str(new_id)

func _process(delta: float) -> void:
	if is_hovering:
		print(_time)
		_time = clamp(delta + _time, 0.0, 1.0)
		scale = lerp(_starting_scale, _ending_scale, ease(_time, 0.08))
	elif not is_hovering and scale != _starting_scale:
		pass
		_time = clamp(delta - _time, 0.0, 1.0)
		print("t: ", _time)
		scale = lerp(_ending_scale, _starting_scale, _time)
		print(scale)
		

func scale_card(val : float) -> void:
	scale *= val
func descale_card(val : float) -> void:
	scale /= val

func _on_mouse_sensor_mouse_entered() -> void:
	is_hovering = true


func _on_mouse_sensor_mouse_exited() -> void:
	is_hovering = false
