extends TextureRect

func _ready():
	$AnimationPlayer.animation_finished.connect(func (_name: String): queue_free())
	if not Global.first_run:
		visible = true
		$AnimationPlayer.play("fade")
		Global.first_run = true
	else:
		queue_free()
