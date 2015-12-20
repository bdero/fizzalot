extends Node2D


const SCALE_OVER = Vector2(1.1, 1.1)
const SCALE_OUT = Vector2(0.7, 0.7)


var default_pos
var time = 2.3

var button_text

var mouse_over = false


func _ready():
	button_text = get_node("button_text")

	default_pos = get_pos()
	set_process(true)

func _process(delta):
	# Bobbing animation
	time += delta
	set_pos(default_pos + Vector2(0, sin(time*2.9)*10))
	set_rot(sin(time*1.55)/12)

	# Button text scaling
	var destination_scale
	if mouse_over:
		destination_scale = SCALE_OVER
	else:
		destination_scale = SCALE_OUT
	button_text.set_scale(button_text.get_scale().linear_interpolate(destination_scale, delta*8))


func _on_Control_mouse_enter():
	mouse_over = true

func _on_Control_mouse_exit():
	mouse_over = false

func _on_Control_input_event(ev):
	if ev.type == InputEvent.MOUSE_BUTTON and mouse_over:
		print("button clicked")
