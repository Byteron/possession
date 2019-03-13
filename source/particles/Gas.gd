extends Node2D

func emit():
	$Particles2D.emitting = true
	$Particles2D.restart()