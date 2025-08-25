extends Control
	
func _on_play_pressed():
	var tween := get_tree().create_tween()
	tween.tween_property($MarginContainer, "modulate", Color(1,1,1,0),2)
	$MarginContainer/VBoxContainer/MarginContainer/GridContainer/Play.disabled = true
	$MarginContainer/VBoxContainer/MarginContainer/GridContainer/Exit.disabled = true
	await tween.finished
	get_tree().change_scene_to_file("res://Main/Escenario/main.tscn")

func _on_exit_pressed():
	get_tree().quit()

func reactivate_area():
	$Minijuego1/MiniArea.disabled = false
	emit_signal("done")
