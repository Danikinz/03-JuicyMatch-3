extends Control

func _ready():
	var _changed = Global.connect("changed",self,"_on_score_changed")
	_on_score_changed()

func _on_score_changed():
	$Score.text = "Score: " + str(Global.score)
	
func _on_level_changed():
	$Level.text = "Level: " + str(Global.level)
