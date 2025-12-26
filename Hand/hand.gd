extends Control

@onready var card_mock = preload("res://card/card_mockup.tscn")
@onready var abstract_card = preload("res://Commons/card/abstract_card.tscn")
@onready var test_card_form = preload("res://card/test_card.tres")

var hand

func _ready() -> void:
	hand = []
	for i in 5:
		hand.append(abstract_card.instantiate())
		hand[i].card_form = test_card_form
	
	
	for i in hand.size():
		var card = hand[i]
		add_child(card)
		card.position.x = -hand.size() * 60
	 
		card.position.x += i * 240
		card.position.x /= 2
		print(card.position)
