extends Particles


var initial_position

func _ready():
	initial_position = get_translation()
	set_process(true)

func _process(delta):
	set_translation(initial_position + Vector3(0, rand_range(0, 0.8), 0))
