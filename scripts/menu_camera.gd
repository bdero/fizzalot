extends Camera


var destination

func _ready():
	destination = get_parent().get_node("camera_destination")
	set_process(true)

func _process(delta):
	var new_position = get_translation().linear_interpolate(destination.get_translation(), delta/2)
	set_translation(new_position)
