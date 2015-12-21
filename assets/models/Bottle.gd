extends Spatial


var time = 0
var animations

func _ready():
	animations = get_node("animations")
	animations.play("default")
	set_process(true)

func _process(delta):
	time += delta
	rotate_y(0.5*delta)

	if time > 2.5 && animations.get_current_animation() != "pop":
		animations.play("pop")
