extends CanvasLayer

onready var GameScene = get_node_or_null("/root/GameScene")
func _ready():
	pass
	#update_health()
	#update_score()
	
func _physics_process(delta):
	var current_scene = get_tree().get_current_scene()
	if(current_scene == GameScene):
		visible = true
		print("UI is visible")

#func update_health():
	#$Health.text = "Health: " + str(Global.health)

#func update_score():
	#$Score.text = "Score: " + str(Global.score)
