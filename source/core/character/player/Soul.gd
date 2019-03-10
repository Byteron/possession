extends Sprite

var target = null

export(int) var speed = 400

onready var tween = $Tween

func _process(delta):
	if target:
		var direction = (target.global_position - global_position).normalized()
		global_position += direction * speed * delta