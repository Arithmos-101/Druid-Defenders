extends Control

@export_group("Connections")
@export var card_hand : CardHand
@export var card_draw : CardDraw
@export var card_discard : CardDiscard
@export var card_deck : CardDeck
@export_group("Deck")
@export var starting_hand_size : int
@export var deck : Array[int] # Array of card IDs

func _ready() -> void:
	card_draw.connect("card_drawn", card_hand.append_card)
	card_hand.connect("card_used", card_discard.append_card)
	
	for id in deck:
		card_deck.add_card_with_id(id)
	card_deck.shuffle()
	for card in card_deck.card_stack:
		card_draw.append_card(card)
		
