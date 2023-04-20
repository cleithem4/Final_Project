extends Node2D


func _process(delta):
d ds	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
