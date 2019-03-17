extends CanvasLayer

# Scenes

var Game = "res://source/core/Game.tscn"
var Intro = "res://source/interface/story/stories/Intro.tscn"
var TitleScreen = "res://source/interface/menus/TitleScreen.tscn"
var Options = "res://source/interface/menus/Options.tscn"
var inter01 = "res://source/interface/story/Intermission01.tscn"
var inter02 = "res://source/interface/story/Intermission02.tscn"
var inter03 = "res://source/interface/story/Intermission03.tscn"
var level04 = "res://source/core/levels/04_First.tscn"
var level05 = "res://source/core/levels/05_Second.tscn"
var Ending = "res://source/interface/story/Ending.tscn"


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