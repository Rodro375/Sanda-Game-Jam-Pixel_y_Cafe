extends Sprite2D
enum Comportamiento{unico,fijo,rafaga,circulo,especial}
@onready var jugador = $"../jugador"
@export var comportamiento:Comportamiento = Comportamiento.rafaga
@export var dificultad:int
@export var intervalosDisparo: Array[float]=[0,0,0,0,0]
@export var proyectilNormal: PackedScene
@export var velocidadesBala: Array[float]=[0,0,0,0,0]
@export var proyectilEspecial: PackedScene
@export var espacioBalistico: Node2D
func _physics_process(_delta: float) -> void:
	if (comportamiento != Comportamiento.especial and comportamiento != Comportamiento.fijo):
		look_at(jugador.position)
func _ready() -> void:
	var relojDisparo:Timer= Timer.new()
	relojDisparo.one_shot=false
	add_child(relojDisparo)
	if comportamiento!=Comportamiento.especial:
		relojDisparo.start(elegirIntervaloDisparo())
		relojDisparo.timeout.connect(func():elegirComportamientoDisparo())
	else:
		Disparar()
func elegirIntervaloDisparo()->float:
	if dificultad==0:

		return intervalosDisparo[0]
	
	else :
		var tiempo:float = randf_range(intervalosDisparo[dificultad-1],intervalosDisparo[dificultad])
	
		return tiempo
func elegirComportamientoDisparo():
	if dificultad>=3: #PUEDE ELEGIR AL AZAR SU COMPORTAMIENTO
		var elegido:int =randi_range(0,Comportamiento.size()-1)
		comportamiento= Comportamiento.values()[elegido]
	
		Disparar()
	else:
		Disparar()
func Disparar():
	print("Orden de disparo")
	match comportamiento:
		Comportamiento.unico:
			var bala:RigidBody2D=proyectilNormal.instantiate()
			espacioBalistico.add_child(bala)
			bala.position=global_position
			bala.look_at(jugador.global_position)
			bala.linear_velocity=Vector2.RIGHT.rotated(bala.rotation)*(velocidadesBala[dificultad])
			
		Comportamiento.fijo:
			var bala:RigidBody2D=proyectilNormal.instantiate()
			espacioBalistico.add_child(bala)
			bala.position=global_position
			bala.rotation=rotation
			bala.linear_velocity=Vector2.RIGHT.rotated(bala.rotation)*(velocidadesBala[dificultad])
		
		Comportamiento.rafaga:
			var rotacionFija=rotation
			for i in range(0,3):
				rotation=rotacionFija
				var bala:RigidBody2D=proyectilNormal.instantiate()
				espacioBalistico.add_child(bala)
				bala.position=global_position
				bala.rotation=rotation
				bala.linear_velocity=Vector2.RIGHT.rotated(bala.rotation)*(velocidadesBala[dificultad]*1.5)
				await get_tree().create_timer(intervalosDisparo[4]).timeout #LAS BALAS TIENEN INTERFVALO MÍNIMO ENTRE SÍ
				#POR DEFECTO ES 0.15s
		Comportamiento.circulo:
			for i in range(0,8):
				var bala:RigidBody2D=proyectilNormal.instantiate()
				espacioBalistico.add_child(bala)
				bala.position=global_position
				bala.rotation_degrees=45*i
				bala.linear_velocity=Vector2.RIGHT.rotated(bala.rotation)*velocidadesBala[dificultad]
		
		Comportamiento.especial:
					var alerta:RigidBody2D=proyectilEspecial.instantiate()
					espacioBalistico.add_child(alerta)
					var posBala1=global_position+Vector2(60,60).rotated(rotation)
					var rotBala1=45+global_rotation_degrees
					alerta.position=posBala1
					alerta.rotation_degrees=rotBala1
					var alerta2:RigidBody2D=proyectilEspecial.instantiate()
					espacioBalistico.add_child(alerta2)
					var posBala2=position+Vector2(-60,60).rotated(rotation)
					var rotBala2=135+global_rotation_degrees
					alerta2.position=posBala2
					alerta2.rotation_degrees=rotBala2
					var tweenColor = create_tween()
					tweenColor.set_loops(5)
					tweenColor.tween_property(alerta,"modulate",Color(1,0,0,1),0.1)
					tweenColor.tween_property(alerta2,"modulate",Color(1,0,0,1),0.1)
					await tweenColor.loop_finished
					alerta.modulate=Color(1,1,1,0.5)
					alerta2.modulate=Color(1,1,1,0.5)
					await tweenColor.finished
					
					
					
					
					
					
					alerta.linear_velocity=Vector2.RIGHT.rotated(alerta.rotation)*2000
					alerta2.linear_velocity=Vector2.RIGHT.rotated(alerta2.rotation)*2000
					await get_tree().create_timer(0.25).timeout
					for i in range(1,4):
						var bala:RigidBody2D=proyectilEspecial.instantiate()
						espacioBalistico.add_child(bala)
						bala.position=posBala1
						bala.rotation_degrees=rotBala1
						bala.linear_velocity=Vector2.RIGHT.rotated(bala.rotation)*1200
						var bala2:RigidBody2D=proyectilEspecial.instantiate()
						espacioBalistico.add_child(bala2)
						bala2.position=posBala2
						bala2.rotation_degrees=rotBala2
						bala2.linear_velocity=Vector2.RIGHT.rotated(bala2.rotation)*1200
						await get_tree().create_timer(0.5).timeout
						look_at(jugador.global_position)
						rotation_degrees+=-90
						await Disparar()
		_:
			
			print("Eligiendo otro disparo...")
			
			

	
