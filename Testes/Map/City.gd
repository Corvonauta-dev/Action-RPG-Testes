extends Node2D


func _on_Quit_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://UI/Menu.tscn")


func _on_Player_tree_exiting():
	get_tree().paused = false
	get_tree().change_scene("res://UI/Menu.tscn")
