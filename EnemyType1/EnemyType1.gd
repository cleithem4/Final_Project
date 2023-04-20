extends KinematicBody2D

export var speed = 350
export var health = 5
export var damage = 1

var motion = Vector2.ZERO



var player = null 

#Process the game 
func _physics_process(_delta):
	motion = Vector2.ZERO
	if player:
		motion = position.direction_to(player.position) * speed 
		look_at(player.position)
		$AnimatedSprite.play("Walk")
		motion = move_and_slide(motion)

#Check if player collide or not
func _on_Area2D_body_entered(body):
	player = body

#Area of zombie sight
func _on_Area2D_body_exited(body):
	player = null #set player null so it stop chasing it's target
	
func damage(damage):
	health = health - damage
	if health < 1:
		queue_free()

#Area of zombie attack
func _on_Area2D2_body_entered(body):
	if body.name == "Player":
		body.damage(damage)
