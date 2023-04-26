extends CharacterBody2D
var velocidad = 800
var direccion = Vector2()
var posision
signal tiempo
func _ready():
	posision = Vector2(0,0)
	if Input.is_action_just_pressed("click_left"):
		$Sale_Bala.start()
		direccion=get_global_mouse_position() - global_position
	

func _physics_process(delta):
	Disparar(delta)

func Disparar(delta):
	move_and_collide(direccion.normalized()*velocidad*delta)

# Inicializa la posicion y rotacion 
# a donde apunta el mouse	
func start(pos, dir):
	rotation = dir
	position = pos
	direccion= pos
	posision = Vector2().rotated(rotation)

	


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
