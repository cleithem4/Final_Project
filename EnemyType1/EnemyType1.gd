extends KinematicBody2D

export var speed = 350
export var health = 10

var motion = Vector2.ZERO
var attackDmg = 5
var player = null 

#Process the game 
func _physics_process(_delta):
	motion = Vector2.ZERO
	if player:
		motion = position.direction_to(player.position) * speed 
		look_at(player.position)
	motion = move_and_slide(motion)

#Check if player collide or not
func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		$Area2D/Moan.play()
		$AnimatedSprite.play("Walk")
		player = body

func _on_Area2D_body_exited(body):
	player = null #set player null so it stop chasing it's target
	$AnimatedSprite.play("Idle")

#Zombie dies if health <= 0
func damage(dmg):
	health -= dmg
	if health <= 0:
		queue_free()

func _on_AttackRange_body_entered(body):
	if body.has_method("damage") and body.is_in_group("Player"):
		$CollisionShape2D/Bite.play()
		body.damage(attackDmg)
