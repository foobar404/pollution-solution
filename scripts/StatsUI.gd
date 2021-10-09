extends ColorRect


func _process(delta):
	var player = owner.get_node("Player")
	$HBoxContainer/TrashValue.text = str(Globals.trash)
	$HBoxContainer/HealthValue.text = str(Globals.health)
