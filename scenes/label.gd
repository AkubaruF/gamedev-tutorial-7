extends Label

func _process(delta):
	self.text = "Lamp count: " + str(Global.lamps_count)
