extends CanvasLayer

func _ready():
	if OS.get_name() == "Android" or OS.get_name() == "Web":
		$QuitButton.queue_free()

func go_to_scene(dst: String):
	$ClickPlayer.play()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file(dst)

func _on_play_button_pressed() -> void:
	go_to_scene(Global.select_scene)


func _on_quit_button_pressed() -> void:
	$ClickPlayer.play()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().quit()


func _on_settings_button_pressed() -> void:
	go_to_scene(Global.settings_scene)

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_quit_button_pressed()


func _on_hover() -> void:
	if OS.get_name() == "Android":
		return
	$HoverPlayer.play()


func _on_records_button_pressed() -> void:
	go_to_scene(Global.records_scene)


func _on_credits_button_pressed() -> void:
	go_to_scene(Global.credits_scene)
