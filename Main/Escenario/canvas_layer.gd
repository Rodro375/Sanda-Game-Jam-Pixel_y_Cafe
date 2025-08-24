extends CanvasLayer

func _ready():
	$TextureProgressBar.tint_under = Color(1,1,1,0.5)


func _on_timer_timeout():
	$TextureProgressBar.value -= 2


func _on_minijuego_1_done():
	pass # Replace with function body.
