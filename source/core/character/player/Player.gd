extends Character

onready var anim = $AnimationPlayer
onready var extents = $CollisionShape2D.shape.extents

func _ready():
	._ready()
	$Label.text = name
	Global.Player = self
	change_state("nil")

func make_current():
	change_state("idle")

func _setup_states():
	states.nil = $States/Nil
	states.idle = $States/Idle
	states.walk = $States/Walk
	states.jump = $States/Jump
	states.fall = $States/Fall

	