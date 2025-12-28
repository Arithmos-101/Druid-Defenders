extends Control

const SLIDE_UP_DISTANCE = Vector2(0, 20)

var draw_deck : Array[Card]

var _starting_position : Vector2
var _ending_position : Vector2

func _ready() -> void:
	draw_deck = []
	for i in 5:
		draw_deck.append(CardTypes.default_card.instantiate())
		var card = draw_deck[i]
		card.card_form = CardTypes.test_card_form
		card.scale = Vector2(0.3,0.3)
		add_child(card)
		_starting_position = Vector2.ZERO
		_ending_position = _starting_position - SLIDE_UP_DISTANCE

func _process(delta: float) -> void:
	var top_card = draw_deck.back()
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
