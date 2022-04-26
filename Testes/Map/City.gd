extends Node2D



onready var enemys = $YSort/Enemies
#var Boss = load("res://Enemies/BigBossBat.tscn")
var Enemy = load("res://Enemies/Bat.tscn")
var Poninters = load("res://assets/OffscreenMarker.tscn")
export var enemys_num = 10
export var enemys_num_clube = 8
export var enemys_num_pizzaria = 5
export var enemys_num_parque = 3
var cont = 0
var door = false
var p = null
var kills = 10

onready var qg = $YSort/Buildings/Apartment02
onready var qgd = $YSort/Buildings/Apartment02/Door/CollisionShape2D



func _ready():
	randomize()
	var rand_x
	var rand_y
	p = Poninters.instance()
	
	
	qg.connect("go", self, "on_go")
	p.global_position = Vector2(qgd.global_position.x, qgd.global_position.y)
	$".".add_child(p)
	p.hide()

	
	#RUA 1
	enemy_spawn(-221)
	#clube
	enemy_spawn_area(-468, -221, enemys_num_clube)
	#parque
	enemy_spawn_area(-65, -221, enemys_num_parque)
	#pizzaria
	enemy_spawn_area(23, -221, enemys_num_pizzaria)
	#RUA 2
	enemy_spawn(-123)
	#parque
	enemy_spawn_area(631, -123, enemys_num_parque)
	#clube
	enemy_spawn_area(-468, -123, enemys_num_clube)
	#RUA 3
	enemy_spawn(-16)
	#pizzaria
	enemy_spawn_area(-168, -16, enemys_num_pizzaria)
	#parque
	enemy_spawn_area(-64, -16, enemys_num_parque)
	#RUA 4
	#parque
	enemy_spawn_area(736, 75, enemys_num_parque)
	#RUA 5
	enemy_spawn(186)
	#parque
	enemy_spawn_area(-808, 186, enemys_num_parque)
	#parque
	enemy_spawn_area(24, 186, enemys_num_parque)
	#clube
	enemy_spawn_area(136, 186, enemys_num_clube)
	#pizzaria
	enemy_spawn_area(336, 186, enemys_num_pizzaria)
	#RUA 6
	enemy_spawn(284)
	#parque
	enemy_spawn_area(-472, 284, enemys_num_parque)
	#RUA 7
	enemy_spawn(380)
	#clube
	enemy_spawn_area(-472, 380, enemys_num_clube)
	#parque
	enemy_spawn_area(-72, 380, enemys_num_parque)
	#pizzaria
	enemy_spawn_area(40, 380, enemys_num_pizzaria)
	#RUA 8
	enemy_spawn(492)
	#parque
	enemy_spawn_area(-656, 492, enemys_num_parque)
	#parque
	enemy_spawn_area(624, 492, enemys_num_parque)
	#clube
	enemy_spawn_area(744, 492, enemys_num_clube)
	#RUA 9
	enemy_spawn(588)
	#pizzaria
	enemy_spawn_area(-888, 588, enemys_num_pizzaria)
	#pizzaria
	enemy_spawn_area(-168, 588, enemys_num_pizzaria)
	#parque
	enemy_spawn_area(-48, 588, enemys_num_parque)
	#RUA 10
	enemy_spawn(692)
	#clube
	enemy_spawn_area(-664, 692, enemys_num_clube)
	#parque
	enemy_spawn_area(720, 692, enemys_num_parque)
	#RUA 10
	enemy_spawn(796)
	#parque
	enemy_spawn_area(-945, 796, enemys_num_parque)
	#parque
	enemy_spawn_area(40, 796, enemys_num_parque)
	#clube
	enemy_spawn_area(136, 796, enemys_num_clube)
	#pizzaria
	enemy_spawn_area(344, 796, enemys_num_pizzaria)
	#clube
	enemy_spawn_area(992, 796, enemys_num_clube)

func enemy_spawn(var rand_y):
	randomize()
	var rand_x
	for i in range(enemys_num):
		#var Enemy = load("res://Enemies/Bat.tscn")
		var enemy = Enemy.instance()
		rand_x = rand_range(-900, 900)
		enemy.global_position = Vector2(rand_x, rand_y)
		enemys.add_child(enemy)
		enemy.connect("dead", self, "kills")

func enemy_spawn_area(var x, var y, var n):
	randomize()
	var rand_n = rand_range(0, n)
	for i in range(rand_n):
		var enemy = Enemy.instance()
		enemy.global_position = Vector2(x, y)
		enemys.add_child(enemy)
		enemy.connect("dead", self, "kills")
	

func _process(delta):
	if door:
		door = false
	if cont >= kills:
		p.show()
	
func _on_Quit_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://UI/Menu.tscn")


func _on_Player_tree_exiting():
	if door == false:
		get_tree().paused = false
		get_tree().change_scene("res://UI/Menu.tscn")

func on_go():
	print("porta?")
	door = true
	if cont >= kills:
		get_tree().paused = false
		get_tree().change_scene("res://Map/ProceduralDG/MainRoom.tscn")

func kills():
	cont += 1
