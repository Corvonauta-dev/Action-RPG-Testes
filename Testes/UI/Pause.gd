extends Node

func _ready():
	$VBoxContainer.visible = false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused == false:
			get_tree().paused = true
			$VBoxContainer.visible = true
		else:
			get_tree().paused = false
			$VBoxContainer.visible = false


func _on_Continue_pressed():
	get_tree().paused = false
	$VBoxContainer.visible = false


