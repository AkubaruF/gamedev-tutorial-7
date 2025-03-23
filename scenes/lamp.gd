extends Interactable

func interact():
	queue_free()
	Global.lamps_count += 1
