extends Sprite


var default_pos
var time = 0

func _ready():
	default_pos = get_pos()
	set_process(true)

func _process(delta):
	time += delta
	set_pos(default_pos + Vector2(0, sin(time*2.4)*10))
	set_rot(sin(time*2.5)/15)
