extends KinematicBody2D

export var speed := 400
export var health = 3
export var attackDmg = 1

var velocity = Vector2()

#Get user input for player movement
func get_input():
	rotation = get_global_mouse_position().angle_to_point(position)
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if input_direction:
		$AnimatedSprite.play("Walk")
	else:
		$AnimatedSprite.play("Idle")
	velocity = input_direction * speed


#Process the game
func _physics_process(_delta):
	get_input()
	move_and_slide(velocity)
