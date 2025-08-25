extends SubViewportContainer

signal completado

func _on_dado_dado_completado():
	emit_signal("completado")
	$SubViewport/PanelContainer/VBoxContainer/HBoxContainer/lanzar.disabled = true

func _on_timer_timeout():
	queue_free()
