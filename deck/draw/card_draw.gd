extends Control

var draw_deck : Array[Card]

func _ready() -> void:
	draw_deck = []
	for i in 5:
		draw_deck.append(CardTypes.default_card.instantiate())
		var card = draw_deck[i]
		card.card_form = CardTypes.test_card_form
		card.scale = Vector2(0.3,0.3)
		card.current_container = card.CardContainer.DRAW
		add_child(card)
