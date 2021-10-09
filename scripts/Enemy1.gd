extends Area2D

export (PackedScene) var Trash
var speed = .1
var throw_pause_rate = 3
onready var Sprite = $Enemy1Sprite


func _process(delta):
	position.y += speed

func _on_Enemy1_area_entered(area):
	if area.is_in_group("wall"):
		speed = 0
		_pollution_loop()
	if area.is_in_group("damage"):
		area.queue_free()
		speed = -speed
		Sprite.animation = "dead"
		yield(get_tree().create_timer(.5),"timeout")
		queue_free()

func _pollution_loop():
	Sprite.animation = "eat"
	yield(get_tree().create_timer(throw_pause_rate),"timeout") 
	
	Sprite.animation = "throw"
	var trash = Trash.instance()
	trash.transform = self.global_transform
	get_tree().get_root().add_child(trash)
	
	yield(get_tree().create_timer(throw_pause_rate*3),"timeout")
	_pollution_loop()
	
	



