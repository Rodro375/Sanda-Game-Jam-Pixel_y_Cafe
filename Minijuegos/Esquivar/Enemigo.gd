extends Sprite2D
enum Comportamiento{rafaga,circulo,especial}
@onready var jugador = $"../Escenario/CharacterBody2D"
@export var comportamiento:Comportamiento = Comportamiento.rafaga
@export var dificultad:int
@export var intervalosDisparo: Array[float]=[0,0,0,0,0]
@export var proyectilNormal: PackedScene
@export var velocidadesBala: Array[float]=[0,0,0,0,0]
@export var proyectilEspecial: PackedScene
@export var espacioBalistico: Node2D
func _physics_process(_delta: float) -> void:
	look_at(jugador.position)
func _ready() -> void:
	var relojDisparo:Timer= Timer.new()
	relojDisparo.one_shot=false
	add_child(relojDisparo)
	relojDisparo.start(elegirIntervaloDisparo())
	
	relojDisparo.timeout.connect(func():elegirComportamientoDisparo())
	
func elegirIntervaloDisparo()->float:
	if dificultad==0:
		print("Tiempo de disparo:",intervalosDisparo[0])
		return intervalosDisparo[0]
	else :
		var tiempo:float = randf_range(intervalosDisparo[dificultad-1],intervalosDisparo[dificultad])
		print("Tiempo de disparo:",tiempo)
		return tiempo
func elegirComportamientoDisparo():
	if dificultad>=3:
		var elegido:int =randi_range(0,Comportamiento.size()-1)
		comportamiento= Comportamiento.values()[elegido]
		print("Comportamiento elegido:",comportamiento)
	
		Disparar()
	else:
		Disparar()
func Disparar():
	print("Orden de disparo")
	match comportamiento:
		Comportamiento.rafaga:
			var bala:RigidBody2D=proyectilNormal.instantiate()
			
			espacioBalistico.add_child(bala)
			bala.position=global_position
			
			bala.look_at(jugador.global_position)
			print("Bala en",bala.position,"mirando a ",bala.rotation_degrees)
			bala.linear_velocity=Vector2.RIGHT.rotated(bala.rotation)*velocidadesBala[dificultad]
		Comportamiento.circulo:
			for i in range(0,8):
				var bala:RigidBody2D=proyectilNormal.instantiate()
				espacioBalistico.add_child(bala)
				bala.position=global_position
				bala.rotation_degrees=45*i
				bala.linear_velocity=Vector2.RIGHT.rotated(bala.rotation)*velocidadesBala[dificultad]
			
			
		_:
			
			print("Eligiendo otro disparo...")
			
			

	
