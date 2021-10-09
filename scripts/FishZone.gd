extends Area2D

export (PackedScene) var Fish

onready var Player = get_tree().get_root().get_node("Home/Player")

var fish = []
func _ready():
	for x in range(20):
		var centerpos = $FishZoneHitbox.position 
		var size = $FishZoneHitbox.shape.extents * 2
	#
		var random_position = Vector2()
		random_position.x = (randi() % int(size.x)) - (size.x/2) + centerpos.x
		random_position.y = (randi() % int(size.y)) - (size.y/2) + centerpos.y
	#
		var spawn = Fish.instance()
		spawn.position = random_position
		add_child(spawn)
		fish.append(spawn)

func _on_FishZone_area_entered(area):
	if area.is_in_group("trash"):
		if Globals.health <= 0:
			var trash = get_tree().get_nodes_in_group("trash")
			for t in trash:
				t.queue_free()
			get_tree().reload_current_scene() 
			get_tree().paused = true 
			get_tree().change_scene("res://GameOver.tscn")
			
		if fish.size():
			var f = fish.pop_back()
			f.get_node("FishSprite").animation = "dead"
			yield(get_tree().create_timer(1),"timeout")
			f.queue_free()
