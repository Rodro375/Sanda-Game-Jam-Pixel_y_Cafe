extends Node2D

func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property($Fondo, "modulate", Color(1,1,1,1), 1 )
