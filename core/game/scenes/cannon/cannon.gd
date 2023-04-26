# Este script se encarga de seleccionar 
# y disparar la municion

extends Node2D
var scene_bala = preload("res://core/game/scenes/cannon/Bala.tscn")
# Daño que produce el cañon
var damage = 10
var posision
# Almacena el aungulo que apunta a una ball
var angle
# Permite si se puede disparar
var canShoot = true
func _ready():
	pass
	
func _physics_process(delta):
	## Mostrar FPS ##
	get_node("fps").text = str(Engine.get_frames_per_second())
	detectBall()


# Detecta una ball
func detectBall():
	var overlapping_bodies = get_node("vision").get_overlapping_bodies()
	print(overlapping_bodies)
	print(str(Engine.get_frames_per_second()))
	for body in overlapping_bodies:
		if body.is_in_group("ball") and canShoot:
			# aquí pones el código que quieres ejecutar cuando se detecta la colisión con un objeto del grupo "enemigos"
			# aquí el código que ejecuta cuando se detecta la colisión
			angle = (body.position - global_position).angle()
			angle += 2.3
			pointAndShoot(body.position, angle)
			canShoot = false
		
		## Cerrar ejecucion
		overlapping_bodies = null
		body = null
		return false
		
# Apunta a un ball y dispara
# body_position: Posicion del ball
# angle: Angulo al que se posiciona ball
func pointAndShoot(body_position,angle):
	get_node("Spr_Cañon").rotation = angle
	var bullet = scene_bala.instantiate()
	# Direcciona la bala a la direccion del objeto
	bullet.direccion = (body_position - global_position)
	bullet.position = Vector2(0,0)
	add_child(bullet)
		


func _on_canshoot_timeout():
	canShoot = true
