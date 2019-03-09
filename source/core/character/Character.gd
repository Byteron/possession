class_name Character extends KinematicBody2D

signal state_changed(new_state)

var motion = Vector2()

var current_state = null

onready var states = {}

onready var body = $Sprite

onready var upper_ray = $Rays/Upper
onready var downer_ray = $Rays/Downer

onready var cliff_timer = $CliffTimer

func _ready():
	_setup_states()

func _unhandled_input(event):
	current_state.input(self, event)

func _physics_process(delta):
	current_state.update(self, delta)

func change_state(new_state):
	if current_state:
		current_state.exit()
	current_state = states[new_state]
	current_state.enter(self)
	emit_signal("state_changed", current_state.name)

func flip():
	if is_facing_left():
		flip_right()
	else:
		flip_left()

func flip_left():
	body.flip_h = true
	upper_ray.rotation_degrees = 90
	downer_ray.rotation_degrees = 90

func flip_right():
	body.flip_h = false
	upper_ray.rotation_degrees = -90
	downer_ray.rotation_degrees = -90

func is_facing_left():
	return body.flip_h

func is_facing_right():
	return not body.flip_h

func is_on_cliff():
	if not upper_ray.is_colliding() and downer_ray.is_colliding() and cliff_timer.is_stopped():
		var collider = downer_ray.get_collider()
		if collider == Global.Terrain:
			return true
	return false

func is_on_slide_wall():
	if upper_ray.is_colliding() and downer_ray.is_colliding() and not is_on_floor():
		var collider = downer_ray.get_collider()
		if collider == Global.Terrain:
			return true
	return false

func _setup_states():
	print("Character::_ready->_setup_states: Overwrite!")
