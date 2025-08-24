extends Sprite2D
enum TipoDado{D6,D9,D12}
@export var tipoDado:TipoDado
@export var maximoTiempo:float
@export var texturaD9:Texture2D
@export var texturaD12: Texture2D
var numeroIntento:int=0
func _ready() -> void:
	match tipoDado:
		TipoDado.D6:
			texture=texturaD9
			hframes=3
			vframes=3
		TipoDado.D9:
			texture=texturaD9
			hframes=3
			vframes=3
		TipoDado.D12:
			texture=texturaD12
			hframes=4
			vframes=3
			
func Lanzar():
	#MANEJO INTERNO DE PROBABILIDAD
	numeroIntento+=1
	var numerodado:int
	
	match tipoDado:
		TipoDado.D6:
			
			numerodado=randi_range(1+numeroIntento,6)
			print("Rango",numeroIntento,"-6")
			$AnimationPlayer.play("lanzar")
			await get_tree().create_timer(randf_range(0.25,maximoTiempo)).timeout
			$AnimationPlayer.stop()
			$".".frame=numerodado-1
			if(numeroIntento==6):	numeroIntento=0
			if(numerodado==6):	Exito()
			else:	Fracaso()
		TipoDado.D9:
			numerodado=randi_range(1+numeroIntento,9)
			print("Rango",numeroIntento,"-9")
			$AnimationPlayer.play("lanzar")
			await get_tree().create_timer(randf_range(0.25,maximoTiempo)).timeout
			$AnimationPlayer.stop()
			$".".frame=numerodado-1
			if(numeroIntento==9):	numeroIntento=0
			if(numerodado==9):	Exito()
			else:	Fracaso()
		TipoDado.D12:
			
			numerodado=randi_range(1+numeroIntento,12)
			print("Rango",numeroIntento,"-12")
			$AnimationPlayer.play("lanzar")
			await get_tree().create_timer(randf_range(0.15,maximoTiempo)).timeout
			$AnimationPlayer.stop()
			$".".frame=numerodado-1
			if(numeroIntento==12):	numeroIntento=0
			if(numerodado==12):	Exito()
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

	

	
	
	
