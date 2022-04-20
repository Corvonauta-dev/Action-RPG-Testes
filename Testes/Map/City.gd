extends Node2D



onready var enemys = $YSort/Enemies
var enemys_num = 10

var door = false

onready var qg = $YSort/Buildings/Apartament01

func _ready():
	randomize()
	var rand_x
	var rand_y
	
	qg.connect("go", self, "on_go")
	
	
	for i in range(enemys_num):
		var Enemy = load("res://Enemies/Bat.tscn")
		var enemy = Enemy.instance()
		rand_x = rand_range(-900, 900)
		rand_y = -221
		enemy.global_position = Vector2(rand_x, rand_y)
		enemys.add_child(enemy)
		
	for j in range(enemys_num):
		var Enemy = load("res://Enemies/Bat.tscn")
		var enemy = Enemy.instance()
		rand_x = rand_range(-900, 900)
		rand_y = -123
		enemy.global_position = Vector2(rand_x, rand_y)
		enemys.add_child(enemy)	
		
	for k in range(enemys_num):
		var Enemy = load("res://Enemies/Bat.tscn")
		var enemy = Enemy.instance()
		rand_x = rand_range(-900, 900)
		rand_y = -16
		enemy.global_position = Vector2(rand_x, rand_y)
		enemys.add_child(enemy)
		
	#for l in range(enemys_num):
	#	var Enemy = load("res://Enemies/Bat.tscn")
	#	var enemy = Enemy.instance()
	#	rand_x = rand_range(-900, 900)
	#	rand_y = 83
	#	enemy.global_position = Vector2(rand_x, rand_y)
	#	enemys.add_child(enemy)
	
	for l in range(enemys_num):
		var Enemy = load("res://Enemies/Bat.tscn")
		var enemy = Enemy.instance()
		rand_x = rand_range(-900, 900)
		rand_y = 186
		enemy.global_position = Vector2(rand_x, rand_y)
		enemys.add_child(enemy)
	
	for m in range(enemys_num):
		var Enemy = load("res://Enemies/Bat.tscn")
		var enemy = Enemy.instance()
		rand_x = rand_range(-900, 900)
		rand_y = 284
		enemy.global_position = Vector2(rand_x, rand_y)
		enemys.add_child(enemy)
	
	for n in range(enemys_num):
		var Enemy = load("res://Enemies/Bat.tscn")
		var enemy = Enemy.instance()
		rand_x = rand_range(-900, 900)
		rand_y = 380
		enemy.global_position = Vector2(rand_x, rand_y)
		enemys.add_child(enemy)
	
	for o in range(enemys_num):
		var Enemy = load("res://Enemies/Bat.tscn")
		var enemy = Enemy.instance()
		rand_x = rand_range(-900, 900)
		rand_y = 492
		enemy.global_position = Vector2(rand_x, rand_y)
		enemys.add_child(enemy)
	
	for p in range(enemys_num):
		var Enemy = load("res://Enemies/Bat.tscn")
		var enemy = Enemy.instance()
		rand_x = rand_range(-900, 900)
		rand_y = 588
		enemy.global_position = Vector2(rand_x, rand_y)
		enemys.add_child(enemy)
	
	for q in range(enemys_num):
		var Enemy = load("res://Enemies/Bat.tscn")
		var enemy = Enemy.instance()
		rand_x = rand_range(-900, 900)
		rand_y = 692
		enemy.global_position = Vector2(rand_x, rand_y)
		enemys.add_child(enemy)
	
	for r in range(enemys_num):
		var Enemy = load("res://Enemies/Bat.tscn")
		var enemy = Enemy.instance()
		rand_x = rand_range(-900, 900)
		rand_y = 796
		enemy.global_position = Vector2(rand_x, rand_y)
		enemys.add_child(enemy)
	
func _process(delta):
	if door:
		door = false
	
func _on_Quit_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://UI/Menu.tscn")


func _on_Player_tree_exiting():
	if !door:
		get_tree().paused = false
		get_tree().change_scene("res://UI/Menu.tscn")

func on_go():
	door = true
