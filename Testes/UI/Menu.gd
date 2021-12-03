extends Control



func _on_StartButton_pressed():
	get_tree().change_scene("res://Map/City.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_OptionsButton_pressed():
	pass # Replace with function body.
