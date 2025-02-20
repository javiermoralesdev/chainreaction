extends TextureButton

enum PieceType{
	Clubs = 0,
	Diamonds = 1,
	Hearts = 2,
	Spades = 3
}

@export var type: PieceType
@export var player1: bool

func _ready() -> void:
	pressed.connect(_set_piece)

func _set_piece():
	if player1:
		Global.player1_piece = type
	else:
		Global.player2_piece = type
