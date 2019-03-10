class_name PlayerCharacter extends Character

onready var anim = $AnimationPlayer
onready var extents = $CollisionShape2D.shape.extents

func _ready():
	._ready()
	change_state("nil")

func make_current():
	change_state("idle")

func _setup_states():
	states.nil = $States/Nil

	