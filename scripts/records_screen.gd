extends CanvasLayer

@onready var record_line_prefab = preload("res://scenes/record_line.tscn")

func _ready() -> void:
	for r in Global.records.matches:
		var line = record_line_prefab.instantiate()
		line.update(r)
		$ScrollContainer/VBoxContainer.add_child(line)



func _on_back_button_pressed() -> void:
	$ClickPlayer.play()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file(Global.menu_scene)


func _on_back_button_mouse_entered() -> void:
	if OS.get_name() == "Android":
		return
	$HoverPlayer.play()
