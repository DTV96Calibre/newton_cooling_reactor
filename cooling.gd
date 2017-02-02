
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var ambient_temp = 65
var reactor_temp = 1000
var k = 0.25

var tick_length = 1
var tick_time = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass
	
func _process(delta):
	reactor_temp += k*(ambient_temp-reactor_temp) * delta
	tick(delta)
	
func tick(delta):
	tick_time += delta
	
	
	if tick_time >= tick_length :
		tick_time = 0
		tick_action()

func tick_action():
	# Set color of reactor (move this out of tick function for smooth color shift)
	get_child(0).set_color(Color(reactor_temp/256, (reactor_temp-100)/256, (reactor_temp - 100)/256, 256/256))
	print("Reactor temp:", reactor_temp)
	print("Ambient temp:", ambient_temp)


