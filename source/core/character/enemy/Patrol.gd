extends Character

const MARK = preload("res://source/interface/hud/SuspicionMark.tscn")

var vision = 120

onready var anim = $AnimationPlayer
onready var flip_timer = $FlipTimer

func _ready():
	._ready()
	change_state("patrol")

func _process(delta):
	update()

func is_facing_player():
	
	if not Global.Animals:
		return false
	
	for animal in Global.Animals:
		var difference = global_position.x - animal.global_position.x
		print(difference)
		if is_facing_right() and difference < 0 or is_facing_left() and difference > 0:
			return true
		return false
		
func is_player_in_sight():
	
	if not Global.Animals:
		return false
	
	var animals = Global.Animals
	
	var space_state = get_world_2d().direct_space_state
	
	
	var in_sight = false
	for animal in animals:
		if (animal.global_position - global_position).length() > vision:
			continue
		
		var collision = space_state.intersect_ray(global_position, animal.global_position, [self], collision_mask)
		
		if collision and collision.collider == animal:
			in_sight = true
	return in_sight

func spawn_mark():
	var mark = MARK.instance()
	$Mark.add_child(mark)

func _draw():
	draw_circle(to_local(global_position), vision, Color("06FFFFFF"))

func _setup_states():
	states.patrol = $States/Patrol
	states.warned = $States/Warned
	states.sleep = $States/Sleep