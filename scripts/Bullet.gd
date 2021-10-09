extends Area2D

const speed = 200


func _physics_process(delta):
	position -= transform.y * speed * delta

#body.get_node("AnimatedSprite").animation = "dead"
func _on_Bullet_body_entered(body):	
	pass
#	if body.is_in_group("mobs"):
#		queue_free()
			
	
