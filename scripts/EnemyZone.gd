extends Area2D


export (PackedScene) var Enemy1
export (PackedScene) var Enemy2

func _ready():
	var timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer) 
	timer.start(1)
	
func _process(delta):
	Globals.time += delta 

func _on_timer_timeout():
	var centerpos = $EnemyZoneHitbox.position 
	var size = $EnemyZoneHitbox.shape.extents * 2
	var rng = randi() % (60*4)
	var enemy_count = ceil(int(Globals.time) / 20) + 1
	var enemy
	
	if rng + int(Globals.time) >= 60*4:
		enemy = Enemy2
	else:
		enemy = Enemy1	

	for e in range(enemy_count):
		var random_position = Vector2()
		random_position.x = (randi() % int(size.x)) - (size.x/2) + centerpos.x
		random_position.y = (randi() % int(size.y)) - (size.y/2) + centerpos.y
		
		var spawn = enemy.instance()
		spawn.position = random_position
		add_child(spawn)
	
