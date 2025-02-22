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
	mouse_entered.connect($"/root/Select"._on_hover)

func _set_piece():
	%ClickPlayer.play()
	if player1:
		Global.player1.piece = type
	else:
		Global.player2.piece = type
