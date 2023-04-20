extends Control


func _ready():
	pass



func _on_Resume_pressed():
	get_tree().change_scene("res://GameScene.tscn")


func _on_Quit_pressed():
	get_tree().quit()
