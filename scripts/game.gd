extends Node2D

class_name Game

@export var grid_size: Vector2
@export var start_position: Vector2
@onready var cell_prefab = preload("res://scenes/cell.tscn")
var grid = []

var player1 = true

const cell_size = 100

func _ready() -> void:
	for x in range(0, grid_size.x):
		grid.append([])
		for y in range(0, grid_size.y):
			grid[x].append(spawn_tile(x, y))

func spawn_tile(x: int, y: int) -> Cell:
	var tile_instance = cell_prefab.instantiate() as Cell
	tile_instance.position = Vector2(start_position.x + cell_size*x, start_position.y + cell_size*y)
	tile_instance.coord = Vector2(x, y)
	add_child(tile_instance)
	return tile_instance
