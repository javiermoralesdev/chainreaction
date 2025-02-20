extends CanvasLayer

@onready var record_line_prefab = preload("res://scenes/record_line.tscn")

func _ready() -> void:
	for r in Global.records.matches:
		var line = record_line_prefab.instantiate()
		line.update(r)
		$ScrollContainer/VBoxContainer.add_child(line)
