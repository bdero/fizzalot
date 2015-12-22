extends Spatial


var subscenes
var fade

var current_scene = null
var next_scene_name = null
var switch_timer = null

func transition_scene(to_scene):
	if switch_timer != null:
		return

	next_scene_name = to_scene

	switch_timer = Timer.new()
	switch_timer.set_wait_time(0.8)
	switch_timer.set_one_shot(true)
	switch_timer.set_autostart(true)
	switch_timer.connect("timeout", self, "_on_switch_timeout")
	add_child(switch_timer)

	fade.fade_out()

func _on_switch_timeout():
	if next_scene_name == null:
		print("WARNING: Scene switch timeout called, but there's no scene to switch to.")
		return
	swap_scene(next_scene_name)

	switch_timer.queue_free()
	switch_timer = null
	next_scene_name = null

func swap_scene(to_scene):
	if current_scene != null:
		current_scene.queue_free()

	var scene_handle = ResourceLoader.load("res://subscenes/" + to_scene)
	current_scene = scene_handle.instance()

	subscenes.add_child(current_scene)
	var camera = current_scene.get_node("Camera")
	if camera == null:
		print("WARNING: No camera found in new scene \"", to_scene, "\"")
	else:
		camera.make_current()

	fade.fade_in()

func _ready():
	subscenes = get_node("subscenes")
	fade = get_node("fade")
	swap_scene("title_scene.scn")
