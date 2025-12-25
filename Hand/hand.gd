extends Control

@onready var card_mock = preload("res://card/card_mockup.tscn")
var hand

func _ready() -> void:
	hand = []
	hand.append(card_mock.instantiate())
	hand.append(card_mock.instantiate())
	hand.append(card_mock.instantiate())
	hand.append(card_mock.instantiate())
	hand.append(card_mock.instantiate())
	
	
	for i in hand.size():
		var card = hand[i]
		add_child(card)
		card.position.x = -hand.size() * 35 
		card.position.x += i * 120
		card.position.x /= 2
		print(card.position)
