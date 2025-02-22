extends ColorRect


func appear(text: String):
	%WarnPlayer.play()
	visible = true
	$Warning.text = tr(text)
	var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property(self, "scale", Vector2(1, 1), .5)


func _on_accept_button_pressed() -> void:
	%ClickPlayer.play()
	var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property(self, "scale", Vector2(0, 0), .5)
	tween.tween_callback(func (): visible = false)
