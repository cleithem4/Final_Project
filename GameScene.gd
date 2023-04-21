extends Node2D

func _ready():
	pass
func _process(_delta):
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
	elif $Player == null:
		$AudioStreamPlayer.stop()
		get_tree().change_scene("res://UI/Main_Menu.tscn")
	
