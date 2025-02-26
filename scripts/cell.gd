extends Area2D

class_name Cell

signal infected(coord: Vector2, player1: bool)
signal clicked

var count = 0
var player1 = true
var coord = Vector2.ZERO
var is_chained = false

func _ready() -> void:
	mouse_entered.connect(_on_hover)

func _on_hover():
	(get_parent() as Game).on_hover()

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if (get_parent() as Game).game_over:
		return
	if event.is_action_pressed("click"):
		if (get_parent() as Game).player1 == player1 or count == 0:
			count += 1
			(get_parent() as Game).play_stomp()
			set_player((get_parent() as Game).player1)
			check_infect()
func _process(_delta: float) -> void:
	$Sprite1.visible = count >= 1
	$Sprite2.visible = count >= 2
	$Sprite3.visible = count >= 3
	$Sprite1.modulate = decide_color()
	$Sprite2.modulate = decide_color()
	$Sprite3.modulate = decide_color()
	var sprite = Global.pieces[Global.player1.piece] if player1 else Global.pieces[Global.player2.piece]
	$Sprite1.texture = sprite
	$Sprite2.texture = sprite
	$Sprite3.texture = sprite

func decide_color() -> Color:
	return Global.player1.color if player1 else Global.player2.color

func set_player(p: bool):
	player1 = p

func check_infect():
	if is_chained:
		return
	clicked.emit()
	match count:
		1:
			pass
		2:
			if is_corner():
				infect()
		3:
			if is_edge():
				infect()
		4:
			if not is_corner() and not is_edge():
				infect()
		_:
			infect()

func infect():
	if is_chained:
		return
	is_chained = true
	count = 0
	infected.emit(coord, player1)

func is_corner() -> bool:
	var size = (get_parent() as Game).grid_size - Vector2(1, 1)
	return (coord.x == 0 && coord.y == 0) || (coord.x == size.x && coord.y == 0) || (coord.x == 0 && coord.y == size.y) || (coord.x == size.x && coord.y == size.y)

func is_edge() -> bool:
	var size = (get_parent() as Game).grid_size - Vector2(1, 1)
	return not is_corner() && (coord.x == 0 || coord.y == 0 || coord.x == size.x || coord.y == size.y)
