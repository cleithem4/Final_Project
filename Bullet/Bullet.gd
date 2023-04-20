extends KinematicBody2D


var velocity = Vector2.ZERO
var speed = 1000.0
var damage = 1

func _physics_process(delta):
	velocity = Vector2(0, speed).rotated(rotation)
	position += velocity * delta


func _on_Area2D_body_entered(body):
	if body.has_method("damage"):
		body.damage(damage)
