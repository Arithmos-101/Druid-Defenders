extends Control
class_name CardDeck

var card_stack : Array[Card]

func add_card_with_id(id : int) -> void:
	var card_form = CardTypes.card_forms.get(id)
	var card = CardTypes.default_card.instantiate()
	card.card_form = card_form
	card_stack.append(card)

func shuffle() -> void:
	card_stack.shuffle()
