extends Label

func _process(delta):
	if Input.is_action_pressed("sprint"):
		self.text = "Speed: Sprinting"
	elif Input.is_action_pressed("crouch"):
		self.text = "Speed: Crouching"
	else:
		self.text = "Speed: Walking"
