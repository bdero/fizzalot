extends Node2D


var default_size
const VEC2_IDENT = Vector2(1, 1)

func _ready():
	default_size = Vector2(Globals.get("display/width"), Globals.get("display/height"))
	set_process(true)

func _process(delta):
	var vp_width = get_viewport_rect().size.width
	self.set_scale(VEC2_IDENT*vp_width/default_size.width)
