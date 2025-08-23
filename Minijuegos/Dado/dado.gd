extends Sprite2D
enum TipoDado{D6,D9,D12,D20}
@export var tipoDado:TipoDado
@export var maximoTiempo:float
func Lanzar():
	#MANEJO INTERNO DE PROBABILIDAD
	var numerodado:int
	match tipoDado:
		TipoDado.D9:
			numerodado=randi_range(1,9)
			print(numerodado)
			$AnimationPlayer.play("lanzar")
			await get_tree().create_timer(randf_range(0.25,maximoTiempo)).timeout
			$AnimationPlayer.stop()
			$".".frame=numerodado-1
			if(numerodado==9):	Exito()
			else:	Fracaso()
			
func Exito():
	#DEFINIR TRANSICION DE EXITO
	$AnimationPlayer.play("exito")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("RESET")
	await $AnimationPlayer.animation_finished

func Fracaso():
	#AQUÍ DEBERÍA MANEJARSE EL SHADER
	$AnimationPlayer.play("fracaso")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("RESET")
	await $AnimationPlayer.animation_finished

	

	
	
	
