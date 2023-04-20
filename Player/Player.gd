extends KinematicBody2D

export var speed := 400
export var health = 3
export var attackDmg = 1

var velocity = Vector2()
onready var Bullet = load("res://Bullet/Bullet.tscn")
onready var end_of_gun = $end_of_gun
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
	if Input.is_action_just_pressed("shoot"):
		var bullet = Bullet.instance()
		var target = get_global_mouse_position()
		#bullet.rotation = get_global_mouse_position().angle_to_point(position)
		bullet.global_position = end_of_gun.global_position
		bullet.rotation = rotation + 300
		get_parent().add_child(bullet)


