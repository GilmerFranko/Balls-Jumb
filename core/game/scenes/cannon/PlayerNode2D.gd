# Este script se encarga de seleccionar 
# y disparar la municion

extends Node2D
var scene_bala = preload("res://core/game/scenes/cannon/Bala.tscn")
var Bala
var posision
var angulo= Vector2()
var a
func _ready():
	pass
	
func _input(input):
	#print(1)
	
	Teclas()
	Bala()
#	if a==2:
#		Misil()
#		$Player/Armas/Seleccionado.offset.x = 253.5
#
#	if a==3:
#		$Player/Armas/Seleccionado.offset.x = 284.5
#	if a==4:
#		$Player/Armas/Seleccionado.offset.x = 316.5
#	if a==5:
#		$Player/Armas/Seleccionado.offset.x = 347.5
#
#	if a==6:
#		$Player/Armas/Seleccionado.offset.x = 379

func Teclas():

	if Input.is_action_just_pressed("1"):
		a=1
	
func Bala():
	var mouse_pos = get_local_mouse_position()
	var angle = (mouse_pos - global_position).angle()
	angle += 2.3
	get_node("Spr_Cañon").rotation = angle
	posision = get_global_mouse_position() - global_position
	if Input.is_action_just_pressed("click_left"):
		var bullet = scene_bala.instance()
		bullet.start($"Spr_Cañon/Posision".global_position, rotation)
		bullet.direccion = posision
		add_child(bullet)
		
func Misil():
	pass
#	posision = get_global_mouse_position() - global_position
#	if Input.is_action_just_pressed("click"):
#		Bala = scene_misil.instance()
#		Bala.position = $Player.position
#		Bala.direccion= posision
#		add_child(Bala)		
