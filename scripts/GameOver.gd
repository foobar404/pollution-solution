extends CanvasLayer


func _ready():
	var time = $Panel/VBoxContainer/CenterContainer3/HBoxContainer/TimeValue
	var trash = $Panel/VBoxContainer/CenterContainer3/HBoxContainer/TrashValue
	trash.text = str(Globals.trash)
	
	var minutes = Globals.time / 60
	time.text = str(floor(minutes)) + ":" + str(int(Globals.time) % 60)
	
	Globals.time = 0.0
	Globals.trash = 0
	Globals.health = 100
	
func _on_Button_pressed():
	get_tree().change_scene("res://Home.tscn")
	get_tree().paused = false
