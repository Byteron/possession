extends CanvasLayer

# Scenes

var Game = "res://source/core/Game.tscn"

# GLOBAL

var next_scene = null

onready var anim = $AnimationPlayer

func change(scene):
	next_scene = scene
	anim.play("fade_out")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene(next_scene)
		next_scene = null
		anim.play("fade_in")