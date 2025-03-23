extends Area3D

@export var sceneName := "Level1"

func _on_body_entered(body: Node3D) -> void:
	if body.get_name() == "Player":
		get_tree().change_scene_to_file(str("res://scenes/" + sceneName + ".tscn"))
		Global.lamps_count = 0
