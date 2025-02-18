extends Node

@onready var pieces = [
	preload("res://sprites/suit_clubs.png"),
	preload("res://sprites/suit_diamonds.png"),
	preload("res://sprites/suit_hearts.png"),
	preload("res://sprites/suit_spades.png")
]

var player1_piece = 3
var player2_piece = 1
var player1_color = Color.BROWN
var player2_color = Color.CORNFLOWER_BLUE
