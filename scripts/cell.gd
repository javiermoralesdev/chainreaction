extends Area2D

class_name Cell

var count = 0
var player1 = true
var coord = Vector2.ZERO

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		count += 1
		set_player((get_parent() as Game).player1)

func _process(_delta: float) -> void:
	$Sprite1.visible = count >= 1
	$Sprite2.visible = count >= 2
	$Sprite3.visible = count >= 3

func set_player(p: bool):
	player1 = p
	var sprite = Global.pieces[Global.player1_piece] if p else Global.pieces[Global.player2_piece]
	$Sprite1.texture = sprite
	$Sprite2.texture = sprite
	$Sprite3.texture = sprite
