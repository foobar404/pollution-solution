extends Area2D

var speed = .1

func _process(delta):
	position.y += speed

func _on_Trash_area_entered(area):
	if area.is_in_group("ocean"):
		var player = get_tree().get_root().get_node("Home").get_node("Player")
		Globals.health -= 5
		queue_free()
	if area.is_in_group("player"):
		var player = get_tree().get_root().get_node("Home").get_node("Player")
		Globals.trash += 1
		queue_free()
