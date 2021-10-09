extends KinematicBody2D


export (PackedScene) var Bullet
const ACCELERATION = 800
const MAX_SPEED = 80
var motion = Vector2()  
var gun_upgrade = 1
var player_item = "gun" + String(gun_upgrade) 

func get_input():
	if Input.is_action_just_pressed("ui_action"):
		var b = Bullet.instance()
		owner.add_child(b)
		b.transform = $PlayerItem.global_transform
		
	if Input.is_action_just_pressed("ui_action"):
		var pew = get_tree().get_root().get_node("Home/Pew")
		print(pew)
		pew.play()
	if Input.is_action_pressed("ui_action"):
		$Hero.animation = "action"
		$PlayerItem.animation = player_item
	else:
		$Hero.animation = "idle"
		$PlayerItem.animation = "default"
	
func _physics_process(delta):
	get_input()
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	if input_vector != Vector2.ZERO:
		motion += input_vector * ACCELERATION
		motion = motion.clamped(MAX_SPEED)
		motion.normalized()
	else:
		motion = motion.linear_interpolate(Vector2.ZERO, 0.05)

	motion = move_and_slide(motion)
	
	

