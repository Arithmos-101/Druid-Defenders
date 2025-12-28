extends Control

var hand : Array[Card]

func _ready() -> void:
	hand = []
	for i in 3:
		hand.append(CardTypes.default_card.instantiate())
		var card = hand[i]
		card.card_form = CardTypes.test_card_form
		card.position.x += i * 170
		card.scale = Vector2(0.3,0.3)
		card.current_container = card.CardContainer.HAND
		add_child(card)
		
