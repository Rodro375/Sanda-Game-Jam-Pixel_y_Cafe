extends Node2D
var mouse
signal done
signal player_hitted

var esquivar_repo:PackedScene = preload("res://Minijuegos/Minijuego 3/MinijuegoEsquivar.tscn")

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("Left_click") and mouse:
		$"Area de objeto/Chequeo".disabled = true
		mouse = false
		var esquivar = esquivar_repo.instantiate()
		esquivar.completado.connect(reactivate_area)
		esquivar.player_hitted.connect(minus_points)
		add_child(esquivar)

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		mouse = event

func reactivate_area():
	$"Area de objeto/Chequeo".disabled = false
	emit_signal("done")

func minus_points():
	emit_signal("player_hitted")
