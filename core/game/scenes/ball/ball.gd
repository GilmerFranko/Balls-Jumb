extends RigidBody2D

var life = 100


func _ready():
	#set_bounce(0.5)
	pass
	
func _physics_process(delta):
	if Input.is_action_pressed("click_left"):
		position = get_global_mouse_position()

	
func damage(damage = 5):
	life = life - damage
