extends Sprite


func _ready():
	set_process(true)
	get_node("animation").play("FadeIn")

func _process(delta):
	var vp = get_viewport_rect().size
	var scale = Vector2(vp.width, vp.height)*2
	set_scale(scale)
	set_pos(scale/4)
