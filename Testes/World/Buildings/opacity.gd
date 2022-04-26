extends StaticBody2D

onready var tween = get_node("Tween")
var door = false
var qgdoor = false
onready var p = $Pointers 

signal go



func _process(delta):
	if door == true:
		if Input.is_action_just_pressed("interact"):
			emit_signal("go")
			

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		tween.interpolate_property($Sprite, "modulate",
		Color(1,1,1,1), Color(1,1,1,0.5), 0.5,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()

func _on_Area2D_body_exited(body):
	if body.get_name() == "Player":
		tween.interpolate_property($Sprite, "modulate",
		Color(1,1,1,0.5), Color(1,1,1,1), 0.5,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()


func _on_Door_body_entered(body):
	if body.get_name() == "Player":
		door = true
		print("porta entrando")


func _on_Door_body_exited(body):
	if body.get_name() == "Player":
		door = false
		print("porta saindo")
