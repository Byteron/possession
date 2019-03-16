extends TextureProgress

signal seen

var suspicion = 0

export var suspicion_step = 1 # how much suspicion goes up every time we are seen
export var suspicion_drop = 0.25 # how fast suspicion falls

func _ready():
	update()

func _process(delta):
	value = suspicion
	player_hidden()

func player_seen():
	suspicion += suspicion_step
	if suspicion == max_value:
		emit_signal("seen")

func player_hidden():
	suspicion = clamp(suspicion - suspicion_drop, 0, max_value)