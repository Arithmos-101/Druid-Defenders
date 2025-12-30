extends Control

@export var card_hand : CardHand
@export var card_draw : CardDraw

func _ready() -> void:
	card_draw.connect("card_drawn", card_hand.append_card)
