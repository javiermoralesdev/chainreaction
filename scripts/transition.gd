extends CanvasLayer

signal on_transition_finished

@onready var color_rect = $ColorRect
@onready var anim_player = $AnimationPlayer

func _ready():
	color_rect.visible = false
	anim_player.animation_finished.connect(_on_animation_finished)

func transition():
	color_rect.visible = true
	anim_player.play("fade_to_black")

func _on_animation_finished(anim_name: String):
	match anim_name:
		"fade_to_black":
			on_transition_finished.emit()
			anim_player.play("fade_to_normal")
		"fade_to_normal":
			color_rect.visible = false
