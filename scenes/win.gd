extends ColorRect


func _on_button_pressed() -> void:
	Global.lamps_count = 0
	Global.win_check = false
	get_tree().change_scene_to_file(str("res://scenes/Level1.tscn"))
