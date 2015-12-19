extends Sprite


func _ready():
	set_process(true)
	get_node("animation").play("FadeIn")

func _process(delta):
	var vp = get_viewport_rect().size
	var scale = vp
	set_scale(scale*2)
	set_pos(scale/2)
