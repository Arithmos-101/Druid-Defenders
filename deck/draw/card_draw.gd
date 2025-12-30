extends Control
class_name CardDraw

signal card_drawn(card : Card)

const SLIDE_UP_DISTANCE = Vector2(0, 20)

var draw_deck : Array[Card]

var _starting_position : Vector2
var _ending_position : Vector2

func _ready() -> void:
	draw_deck = []
	for i in 3:
		draw_deck.append(CardTypes.default_card.instantiate())
		var card = draw_deck[i]
		card.card_form = CardTypes.test_card_form
		card.scale = Vector2(0.3,0.3)
		card.connect("card_pressed", _on_card_pressed)
		add_child(card)
		_starting_position = Vector2.ZERO
		_ending_position = _starting_position - SLIDE_UP_DISTANCE

func _process(delta: float) -> void:
	var top_card
	if not draw_deck.is_empty():
		top_card = draw_deck.back()
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
	var top_card = draw_deck.back()
	if card != top_card:
		return
	
	pop(top_card)
	emit_signal("card_drawn", top_card)
	
func pop_back() -> Card:
	if draw_deck.is_empty():
		return null
	var card = draw_deck.back()
	remove_child(draw_deck.back())
	draw_deck.pop_back()
	return card

func pop(card : Card) -> bool:
	if draw_deck.is_empty():
		return false
	if not draw_deck.has(card):
		return false
	if not get_children().has(card):
		return false
	draw_deck.pop_at(draw_deck.find(card))
	remove_child(card)
	return true
