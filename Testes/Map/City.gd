extends Node2D



onready var enemys = $YSort/Enemies

func _ready():
	randomize()
	var rand_x
	var rand_y
	
	
	for i in range(10):
		var Enemy = load("res://Enemies/Bat.tscn")
		var enemy = Enemy.instance()
		rand_x = rand_range(-900, 900)
		rand_y = -221
		enemy.global_position = Vector2(rand_x, rand_y)
		enemys.add_child(enemy)
		
	for j in range(10):
		var Enemy = load("res://Enemies/Bat.tscn")
		var enemy = Enemy.instance()
		rand_x = rand_range(-900, 900)
		rand_y = -123
		enemy.global_position = Vector2(rand_x, rand_y)
		enemys.add_child(enemy)	
		
	for k in range(10):
		var Enemy = load("res://Enemies/Bat.tscn")
		var enemy = Enemy.instance()
		rand_x = rand_range(-900, 900)
		rand_y = -16
		enemy.global_position = Vector2(rand_x, rand_y)
		enemys.add_child(enemy)
		
	for l in range(10):
		var Enemy = load("res://Enemies/Bat.tscn")
		var enemy = Enemy.instance()
		rand_x = rand_range(-900, 900)
		rand_y = 83
		enemy.global_position = Vector2(rand_x, rand_y)
		enemys.add_child(enemy)
	
	for m in range(10):
		var Enemy = load("res://Enemies/Bat.tscn")
		var enemy = Enemy.instance()
		rand_x = rand_range(-900, 900)
		rand_y = 186
		enemy.global_position = Vector2(rand_x, rand_y)
		enemys.add_child(enemy)
	
func _on_Quit_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://UI/Menu.tscn")


func _on_Player_tree_exiting():
	get_tree().paused = false
	get_tree().change_scene("res://UI/Menu.tscn")
