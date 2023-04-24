extends KinematicBody2D
export (int) var velocidad = 300
var direccion = Vector2()
var posision
var a
signal tiempo
var tiempo
func _ready():
	posision = Vector2(0,0)
	a=false
	tiempo = false
	direccion=get_global_mouse_position() - global_position
	if Input.is_action_just_pressed("click_left"):
		$Sale_Bala.start()
		direccion=get_global_mouse_position() - global_position
	

func _physics_process(delta):
		Disparar(delta)

func Disparar(delta):
	move_and_collide(direccion.normalized()*velocidad*delta)
	
func start(pos, dir):
	rotation = dir
	position = pos
	posision = Vector2().rotated(rotation)

	


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()


func DesaparecerBalaAlColisionar(body):
	if tiempo == true:
		queue_free()
		


func _on_Sale_Bala_timeout():
	tiempo= true

func _on_Bullet_tiempo():
	$Sale_Bala.start()
