extends Control
class_name CardDraw

signal card_drawn(card : Card)

const SLIDE_UP_DISTANCE = Vector2(0, 20)

var card_stack : Array[Card]

var _starting_scale := Vector2(0.3,0.3)
var _starting_position := Vector2.ZERO
var _ending_position := _starting_position - SLIDE_UP_DISTANCE

func _process(delta: float) -> void:
	var top_card
	if not card_stack.is_empty():
		top_card = card_stack.back()
		card_focus(top_card, delta)

func card_focus(card: Card, delta: float) -> void:
	card_slide_up(card, delta)

func card_slide_up(card: Card, delta: float) -> void:
	if card.is_hovering:
		card.time = clamp(card.time + delta, 0.0, 1.0)
		card.position = lerp(_starting_position, _ending_position, ease(card.time, 0.08))
	else:
		card.time = 0
		card.position = _starting_position

func _on_card_pressed(card : Card) -> void:
	var top_card = card_stack.back()
	if card != top_card:
		return
	if !_can_draw(card):
		return
	pop(top_card)
	emit_signal("card_drawn", top_card)

func _can_draw(card) -> bool:
	return true

func pop_back() -> Card:
	if card_stack.is_empty():
		return null
	var card = card_stack.back()
	card.disconnect("card_pressed", _on_card_pressed)
	remove_child(card_stack.back())
	card_stack.pop_back()
	return card

func pop(card : Card) -> bool:
	if card_stack.is_empty():
		return false
	if not card_stack.has(card):
		return false
	if not get_children().has(card):
		return false
	card.disconnect("card_pressed", _on_card_pressed)
	card_stack.pop_at(card_stack.find(card))
	remove_child(card)
	return true

func append_card(card : Card) -> void:
	card.scale = _starting_scale
	card.position = _starting_position
	card_stack.append(card)
	card.connect("card_pressed", _on_card_pressed)
	add_child(card)
