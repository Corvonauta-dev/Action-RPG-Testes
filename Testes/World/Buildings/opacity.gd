extends StaticBody2D

onready var tween = get_node("Tween")



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
