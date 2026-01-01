extends Control
class_name CardHand

signal card_used(card : Card)

const HOVER_SCALE = Vector2(1.2,1.2)
const CARD_X_SEPERATION = 10
const CARD_X_SEPERATION_CROWDING_SCALE = 0.5

var card_list : Array[Card]

var _starting_scale := Vector2(0.3,0.3)
var _ending_scale := _starting_scale * HOVER_SCALE
var time := 0.0

var _end_deck_position := Vector2.ZERO

func pop(card : Card) -> bool:
	if card_list.is_empty():
		return false
	if not card_list.has(card):
		return false
	if not get_children().has(card):
		return false
	card.disconnect("card_pressed", _on_card_pressed)
	card_list.pop_at(card_list.find(card))
	remove_child(card)
	return true

func append_card(card : Card) -> void:
	var card_real_size = card.size * _starting_scale
	card.scale = _starting_scale
	card.position = _end_deck_position
	card.connect("card_pressed", _on_card_pressed)
	if card_list.size() > 0:
		card.position.x += CARD_X_SEPERATION
	card_list.append(card)
	add_child(card)
	_center_hand(card_real_size)

func _on_card_pressed(card : Card) -> void:
	if !_can_draw(card):
		return
	pop(card)
	emit_signal("card_used", card)

func _can_draw(card) -> bool:
	return true

func _center_hand(appended_card_size : Vector2) -> void:
	if card_list.size() == 1:
		_end_deck_position.x = card_list.back().position.x + appended_card_size.x
		return
	for i in card_list.size():
		var card = card_list[i]
		card.position.x -= (appended_card_size.x + CARD_X_SEPERATION) / 2.0
	_end_deck_position.x = card_list.back().position.x + appended_card_size.x

func _process(delta: float) -> void:
	for card in card_list:
		card_focus(card, delta)

func card_focus(card: Card, delta: float) -> void:
	card_hover(card, delta)

func card_hover(card: Card, delta: float) -> void:
	if card.is_hovering:
		card.time = clamp(card.time + delta, 0.0, 1.0)
		card.scale = lerp(_starting_scale, _ending_scale, ease(card.time, 0.08))
	else:
		card.time = 0
		card.scale = _starting_scale
