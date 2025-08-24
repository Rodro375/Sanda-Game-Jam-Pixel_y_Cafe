extends CanvasLayer

func _ready():
	$TextureProgressBar.tint_under = Color(1,1,1,0.5)


func _on_timer_timeout():
	$TextureProgressBar.value -= 10
