extends Character

onready var anim = $AnimationPlayer

onready var extents = $CollisionShape2D.shape.extents

func _ready():
	._ready()
	Global.Player = self
	change_state("idle")

func _setup_states():
	states.idle = $States/Idle
	states.walk = $States/Walk
	states.jump = $States/Jump
	states.fall = $States/Fall