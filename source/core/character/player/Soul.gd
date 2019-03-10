extends Node2D

var target = null

onready var tween = $Tween

func _process(delta):
	if target:
		tween.interpolate_property(self, "global_position", global_position, target.global_position, 0.08, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()