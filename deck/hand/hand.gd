extends Control

const HOVER_SCALE = Vector2(1.2,1.2)
const CARD_X_SEPERATION = 10
const CARD_X_SEPERATION_CROWDING_SCALE = 0.5

var hand : Array[Card]

var _starting_scale := Vector2(0.3,0.3)
var _ending_scale := _starting_scale * HOVER_SCALE
var time := 0.0

var _end_deck_position := Vector2.ZERO

func _ready() -> void:
	hand = []
	#for i in 5:
	#	append(CardTypes.test_card_form)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Test"):
		append(CardTypes.test_card_form)

func append(type : CardForm) -> void:
	var card = CardTypes.default_card.instantiate()
	var card_real_size = card.size * _starting_scale
	card.card_form = type
	card.scale = _starting_scale
	print(_end_deck_position)
	card.position.x = _end_deck_position.x
	if hand.size() > 0:
		card.position.x += CARD_X_SEPERATION
	hand.append(card)
	add_child(card)
	_center_hand(card_real_size)

func _center_hand(appended_card_size : Vector2) -> void:
	await get_tree().create_timer(0.5).timeout
	print("back pos ",hand.back().position)
	if hand.size() == 1:
		_end_deck_position = hand.back().position + appended_card_size
		return
	for i in hand.size():
		print("here")
		var card = hand[i]
		card.position.x -= (appended_card_size.x + CARD_X_SEPERATION) / 2.0
	_end_deck_position = hand.back().position + appended_card_size

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
