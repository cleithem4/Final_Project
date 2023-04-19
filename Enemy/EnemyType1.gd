extends KinematicBody2D

export var speed = 350
export var health = 5
export var attackDmg = 1

var motion = Vector2.ZERO



var player = null 

#Process the game 
func _physics_process(_delta):
	motion = Vector2.ZERO
	if player:
		motion = position.direction_to(player.position) * speed 
	motion = move_and_slide(motion)

#Check if player collide or not
func _on_Area2D_body_entered(body):
	player = body 


func _on_Area2D_body_exited(body):
	player = null #set player null so it stop chasing it's target
