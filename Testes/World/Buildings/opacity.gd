extends StaticBody2D

onready var tween = get_node("Tween")
var door = false
signal go

func _process(delta):
	if door == true:
		if Input.is_action_just_pressed("interact"):
			emit_signal("go")
			get_tree().paused = false
			get_tree().change_scene("res://Map/ProceduralDG/MainRoom.tscn")

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
	door = true
	print("porta entrando")


func _on_Door_body_exited(body):
	door = false
	print("porta saindo")
