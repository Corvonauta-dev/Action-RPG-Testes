extends Area2D

var bat = null

func can_see_bat():
	return bat != null

func _on_BatDetctionZone_body_entered(body):
	bat = body


func _on_BatDetctionZone_body_exited(body):
	bat = null
