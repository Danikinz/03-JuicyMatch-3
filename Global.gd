extends Node

var score = 0
var level = 1
signal changed
var scores = {
	0:0,
	1:0,
	2:0,
	3:10,
	4:20,
	5:50,
	6:100,
	7:200,
	8:300,
	9:1000
}

func _unhandled_input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

func change_score(s):
	var camera = get_node_or_null("/root/Game/Camera")
	if camera:
		camera.add_trauma(.5)
	score += s
	emit_signal("changed")

func change_level(s):
	var camera = get_node_or_null("/root/Game/Camera")
	if camera:
		camera.add_trauma(.5)
	level += s 
	emit_signal("changed")
