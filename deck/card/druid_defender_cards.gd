extends Node

@onready var card_mock = preload("res://deck/card/card_mockup.tscn")
@onready var default_card = preload("res://Commons/card/card.tscn")
@onready var test_card_form = preload("res://deck/card/card_forms/test_card.tres")

@onready var card_form_001001 = preload("res://deck/card/card_forms/card_form_001001.tres")
@onready var card_form_001002 = preload("res://deck/card/card_forms/card_form_001002.tres")
@onready var card_form_001003 = preload("res://deck/card/card_forms/card_form_001003.tres")
@onready var card_form_001004 = preload("res://deck/card/card_forms/card_form_001004.tres")


@onready var card_forms := {
	test_card_form.id : test_card_form,
	card_form_001001.id : card_form_001001,
	card_form_001002.id : card_form_001002,
	card_form_001003.id : card_form_001003,
	card_form_001004.id : card_form_001004,
	
}
