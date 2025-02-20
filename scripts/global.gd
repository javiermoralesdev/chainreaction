extends Node

@onready var pieces = [
	preload("res://sprites/suit_clubs.png"),
	preload("res://sprites/suit_diamonds.png"),
	preload("res://sprites/suit_hearts.png"),
	preload("res://sprites/suit_spades.png")
]

@onready var game_scene = preload("res://scenes/game.tscn")
@onready var select_scene = preload("res://scenes/select.tscn")
@onready var menu_scene = preload("res://scenes/menu.tscn")

var player1_piece = 3
var player2_piece = 1
var player1_color = Color.WHITE
var player2_color = Color.WHITE
