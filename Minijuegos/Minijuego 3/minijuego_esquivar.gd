extends SubViewportContainer
signal completado
signal player_hitted
func _ready():
	$Timer.start()

func _on_timer_timeout():
	emit_signal("completado")
	queue_free()


func _on_escenario_player_hitted():
	emit_signal("player_hitted")
