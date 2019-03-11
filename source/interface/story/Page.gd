extends Dialoque

onready var anim = $AnimationPlayer
export(Texture) var texture = null

func _ready():
	$TextureRect.texture = texture

func fade_in():
	anim.play("fade_in")

func fade_out():
	anim.play("fade_out")