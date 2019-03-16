extends Character

onready var anim = $AnimationPlayer
onready var flip_timer = $FlipTimer

func _ready():
	._ready()
	change_state("patrol")

func _setup_states():
	states.patrol = $States/Patrol