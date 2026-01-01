extends Control
class_name CardDiscard

var card_stack : Array[Card]

var _starting_scale := Vector2(0.3,0.3)
var _starting_position := Vector2.ZERO

func pop(card : Card) -> bool:
	if card_stack.is_empty():
		return false
	if not card_stack.has(card):
		return false
	if not get_children().has(card):
		return false
	card_stack.pop_at(card_stack.find(card))
	remove_child(card)
	return true

func append_card(card : Card) -> void:
	card.scale = _starting_scale
	card.position = _starting_position
	card_stack.append(card)
	add_child(card)
