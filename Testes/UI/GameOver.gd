extends Control



func _on_MenuButton_pressed():
	get_tree().change_scene("res://UI/Menu.tscn")


func _on_QuitButton2_pressed():
	get_tree().quit()


func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Map/ProceduralDG/MainRoom.tscn")
