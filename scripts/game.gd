extends Node2D

class_name Game

@export var grid_size: Vector2
@export var start_position: Vector2
@onready var cell_prefab = preload("res://scenes/cell.tscn")
var grid = []

var player1 = true
var turns = 0
var game_over = false
var player1_won = false

const cell_size = 100

func reset_grid():
	for row in grid:
		for square in row:
			(square as Cell).is_chained = false

func _ready() -> void:
	for x in range(0, grid_size.x):
		grid.append([])
		for y in range(0, grid_size.y):
			grid[x].append(spawn_tile(x, y))

func show_game_over():
	%WinPlayer.play()
	game_over = true
	var r = Round.new()
	r.player1 = Global.player1
	r.player2 = Global.player2
	r.player1_won = player1_won
	r.turns = turns
	r.time = Time.get_unix_time_from_system()
	Global.update_records(r)
	$GameOver.appear()

func _process(_delta: float) -> void:
	%TurnMark.texture = Global.pieces[Global.player1.piece] if player1 else Global.pieces[Global.player2.piece]
	%TurnMark.modulate = Global.player1.color if player1 else Global.player2.color

func spawn_tile(x: int, y: int) -> Cell:
	var tile_instance = cell_prefab.instantiate() as Cell
	tile_instance.position = Vector2(start_position.x + cell_size*x, start_position.y + cell_size*y)
	tile_instance.coord = Vector2(x, y)
	tile_instance.infected.connect(manage_infection)
	tile_instance.clicked.connect(switch_turn)
	add_child(tile_instance)
	return tile_instance
	

func switch_turn():
	player1 = not player1
	reset_grid()
	turns += 1
	

func manage_infection(coord: Vector2, p1: bool):
	if coord.x != 0:
		propagate(Vector2(coord.x -1, coord.y), p1)
	if coord.y != 0:
		propagate(Vector2(coord.x, coord.y-1), p1)
	if coord.x != grid_size.x-1:
		propagate(Vector2(coord.x +1, coord.y), p1)
	if coord.y != grid_size.y-1:
		propagate(Vector2(coord.x, coord.y+1), p1)
	if game_ended():
		show_game_over()

func game_ended() -> bool:
	if turns < 2:
		return false
	var player1HasPiece = false
	var player2HasPiece = false
	for row in grid:
		for cell in row:
			if cell.count > 0:
				if cell.player1:
					player1HasPiece = true
				else:
					player2HasPiece = true
	if not player2HasPiece:
		player1_won = true
	return not player1HasPiece or not player2HasPiece

func get_cell(c: Vector2) -> Cell:
	return grid[c.x][c.y]

func on_hover():
	if OS.get_name() == "Android":
		return
	%HoverPlayer.play()

func play_stomp():
	%StompPlayer.play()

func propagate(coord: Vector2, p1: bool):
	if get_cell(coord).player1 == p1 or get_cell(coord).count == 0:
		get_cell(coord).player1 = p1
		get_cell(coord).count += 1
		get_cell(coord).check_infect()
	else:
		get_cell(coord).player1 = p1
