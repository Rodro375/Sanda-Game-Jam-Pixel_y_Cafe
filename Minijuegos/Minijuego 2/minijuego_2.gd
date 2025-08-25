extends Node2D
var mouse
signal done

var dados_repo:PackedScene = preload("res://Minijuegos/Minijuego 2/minijuego_dado.tscn")

func _process(delta):
	if Input.is_action_just_pressed("Left_click") and mouse:
		$Minijuego2/MiniArea.disabled = true
		mouse = false
		var dados = dados_repo.instantiate()
		dados.puzzle_solved.connect(reactivate_area)
		add_child(dados)

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		mouse = event

func reactivate_area():
	$Minijuego2/MiniArea.disabled = false
	emit_signal("done")
	
