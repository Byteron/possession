extends Node2D

onready var anim = $AnimationPlayer

func open():
	anim.play("open")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "open":
		queue_free()