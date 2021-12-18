extends Node2D

export (String) var color
var is_matched
var is_counted
var selected = false
var target_position = Vector2(0,0)
var default_modulate = Color(1,1,1,1)
var highlight = Color(1,0.8,0,1)

var Effects = null
var dying = false
var wiggle = 0.0
export var wiggle_amount = 3

export var transparent_time = 1.0
export var scale_time = 1.5 
export var rot_time = 1.5

var Explosion = preload("res://Explosion/Explosion.tscn")

func _ready():
	default_modulate = modulate 
	$Selected.emitting = false

func _physics_process(_delta):
	if dying:
		queue_free()
	if selected:
		if $Select.visible != true:
			$Select.show()
			$Selected.emitting = true
	else:
		if $Select.visible == true:
			$Select.hide()
			$Selected.emitting = false 

func move_piece(change):
	target_position = position + change
	position = target_position

func die():
	#dying = true;
	if Effects == null:
		Effects = get_node_or_null("/root/Game/Effects")
	if Effects != null:
		get_parent().remove_child(self)
		Effects.add_child(self)
		$Timer.wait_time = 0.5 + (randf() / 10.0)
		$Timer.start()
		$Falling.emitting = true


func _on_Timer_timeout():
	if Effects == null:
		Effects = get_node_or_null("/root/Game/Effects")
	if Effects != null:
		var explosion = Explosion.instance()
		explosion.position = position
		Effects.add_child(explosion)
	dying = true;
