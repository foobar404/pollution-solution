extends Area2D

const speed = 200


func _physics_process(delta):
	position -= transform.y * speed * delta


	
