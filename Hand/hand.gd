extends Control

@onready var card_mock = preload("res://card/card_mockup.tscn")
@onready var abstract_card = preload("res://Commons/card/abstract_card.tscn")
@onready var test_card_form = preload("res://card/test_card.tres")

var hand

func _ready() -> void:
	hand = []
	for i in 5:
		hand.append(abstract_card.instantiate())
		var card = hand[i]
		card.card_form = test_card_form
		card.position.x += i * 170
		card.scale = Vector2(0.3,0.3)
		add_child(card)
		
