extends Area2D
var mouse

var tablero_repo:PackedScene = preload("res://Minijuegos/Minijuego 1_2/Tablero/Tablero.tscn")

func _process(delta):
	if Input.is_action_just_pressed("Left_click") and mouse:
		$MiniArea.disabled = true
		mouse = false
		var tablero = tablero_repo.instantiate()
		tablero.puzzle_solved.connect(reactivate_area)
		add_child(tablero)
		
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		mouse = event

func reactivate_area():
	$MiniArea.disabled = false
