extends CanvasLayer
var fase :float= 1
var progreso :int = 2

func _ready():
	$TextureProgressBar.tint_under = Color(1,1,1,0.5)
	$TextureRect.texture = load("res://Referencias/ventana LLUVIA  .png")

func _process(delta):
	$Button.connect("pressed",se_presiono_boton)
	
	if progreso == 500:
		$TextureRect.visible = true
		$TextureRect.texture = load("res://Referencias/final miedo.png")
		$ColorRect.visible = true
		$Label.visible = true
		$Label.text = "Te arrodillas, no tienes fuerzas para levantarte, una autoridad primitiva domina tu cuerpo, como si tus mismas células te traicionaran y se postraran a tal aberración estelar, sus ojos, si es que esas protuberancias se pudieran calificar como tales te apuntan, logras finalmente discernir su encriptada expresión, una sonrisa, esta alegre de finalmente conocer al que ah estado torturando por tanto tiempo, tu corazón, lo escuchas como una metralla bombardeando la sangre que circula tu cuerpo..Te estremeces en esta noche tranquila, entre pánico, sudor y lágrimas. Te pierdes en la oscuridad, en la penumbra, una que en la que sus ojos te observarán eternamente, rendido en el vacío del cosmos, perdido en la locura de su inconmensurable profundidad.El final llegó para ti, en esta noche tranquila."
		$Button.visible = true
		$Button.disabled = false
		$Timer.stop()
		$TextureProgressBar.value = 100
		fase*=fase*1.1
		progreso += 2
	elif progreso == 400:
		$TextureRect.visible = true
		$TextureRect.texture = load("res://Referencias/ventana 5.png")
		$ColorRect.visible = true
		$Label.visible = true
		$Label.text = "No hay nada mas que hacer, todo esto es tu culpa, este es el destino que te mereces por haberle fallado, por haber permitido que su vida se perdiera, no fue un accidente, ambos, “el” y tú lo despertaron. Ahora todo tiene sentido, esto no es por algo mayor, es simplemente un capricho, un deseo efímero de aquel que siempre duerme, huele tu tormento, ya es tarde."
		$Button.visible = true
		$Button.disabled = false
		$Timer.stop()
		$TextureProgressBar.value = 100
		fase*=fase*1.1
		$Tenebroso.play()
		progreso += 2
	elif progreso == 300:
		$TextureRect.visible = true
		$TextureRect.texture = load("res://Referencias/ventana 4.png")
		$ColorRect.visible = true
		$Label.visible = true
		$Label.text = "Tu respiración es fría, tus manos heladas y el estomago burbujeando por recorrer tu esófago, tus latidos, la briza, las teclas y el sonido de la pantalla, todo lo escuchas en un silencio sepulcral, tus sentidos apagados enfocados en aquella cosa que yace detrás de tu ventana, en la profundidad del firmamento, del cosmos, pero algo te dice que el esta acá con un único objetivo. Tú."
		$Button.visible = true
		$Button.disabled = false
		$Timer.stop()
		$TextureProgressBar.value = 100
		fase*=fase*1.1
		progreso += 2
	elif progreso == 200:
		$TextureRect.visible = true
		$TextureRect.texture = load("res://Referencias/ventana 3 .png")
		$ColorRect.visible = true
		$Label.visible = true
		$Label.text = "Esto no es tu imaginación, este claramente es un rostro, un rostro que no mira a nadie mas que a ti, el lo sabe, el sabe lo que pasó aquel día, el representa el odio, la rabia, la ira y la sed de sangre de “el”. Tus recuerdos te llaman, atormentándote una vez más en esta noche tranquila. Tragas saliva, apartas levemente la mirada, tratando de pensar de que… nadie te observa. Ruegas por ello."
		$Button.visible = true
		$Button.disabled = false
		$Timer.stop()
		$TextureProgressBar.value = 100
		fase*=fase*1.1
		$Tormenta.play()
		progreso += 2
	elif progreso == 100:
		$TextureRect.visible = true
		$TextureRect.texture = load("res://Referencias/ventana 2 .png")
		$ColorRect.visible = true
		$Label.visible = true
		$Label.text = "Una mirada en el firmamento, el abismo te devuelve la mirada con un desdén maníaco, no sabes como descifrar las intenciones de esos ojos, o si siquiera son ojos, ¿Qué son esas cosas? Aquel escalofrío recorre todo tu cuerpo, la sangre se enfría debajo de tu piel, quizás solo sea un mal sueño, quizás tenga una explicación, quizás… quizás solo tengas que dejarte llevar y seguir con lo tuyo."
		$Button.visible = true
		$Button.disabled = false
		$Timer.stop()
		$TextureProgressBar.value = 100
		fase*=fase*1.1
		progreso += 2

func _on_timer_timeout():
	$TextureProgressBar.value -= 2*fase

func _on_minijuego_1_done():
	$TextureProgressBar.value += 20
	progreso += 49
func _on_minijuego_2_done():
	$TextureProgressBar.value += 30
	progreso += 49
func _on_minijuego_3_done():
	$TextureProgressBar.value += 40
	progreso += 49
func _on_minijuego_3_player_hitted():
	$TextureProgressBar.value -= 5*fase

func se_presiono_boton():
	$TextureRect.visible = false
	$ColorRect.visible = false
	$Label.visible = false
	$Button.visible = false
	$Button.disabled = true
	$Timer.start()
