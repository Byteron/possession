extends Node2D

signal snapped

var rat = null
var is_snapped = false

onready var anim = $AnimationPlayer

func _unhandled_input(event):
	if not is_snapped and rat and event.is_action_pressed("interact"):
		snap()

func _on_Area2D_body_entered(body):
	if body.name == "Rat":
		rat = body

func _on_Area2D_body_exited(body):
	if body.name == "Rat":
		rat = null

func snap():
	anim.play("snap")
	is_snapped = true
	emit_signal("snapped")