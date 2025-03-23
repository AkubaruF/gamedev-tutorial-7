extends Node

var lamps_count = 0
var win_check = false

func _process(delta: float) -> void:
	if lamps_count == 10 and win_check == false:
		win_check = true
		get_tree().change_scene_to_file(str("res://scenes/win.tscn"))
