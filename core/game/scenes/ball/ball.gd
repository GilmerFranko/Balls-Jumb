extends RigidBody2D

var life = 100


func _ready():
	set_bounce(0.5)
	
func _physics_process(delta):
	pass
	
func damage(damage = 5):
	life = life - damage
