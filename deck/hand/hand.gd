extends Control

const HOVER_SCALE = Vector2(1.2,1.2)

var hand : Array[Card]

var _starting_scale := Vector2(0.3,0.3)
var _ending_scale := _starting_scale * HOVER_SCALE
var time := 0.0

func _ready() -> void:
	hand = []
	for i in 3:
		hand.append(CardTypes.default_card.instantiate())
		var card = hand[i]
		card.card_form = CardTypes.test_card_form
		card.position.x += i * 170
		card.scale = Vector2(0.3,0.3)
		add_child(card)
		
func _process(delta: float) -> void:
	for card in hand:
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
