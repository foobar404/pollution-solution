extends Label


func _process(delta):
	var minutes = Globals.time / 60
	self.text = str(floor(minutes)) + ":" + str(int(Globals.time) % 60)
