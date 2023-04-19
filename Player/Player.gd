extends KinematicBody2D

export var speed := 400


var velocity = Vector2()

#Get user input for player movement
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed


#Process the game
func _physics_process(_delta):
	get_input()
	move_and_slide(velocity)
