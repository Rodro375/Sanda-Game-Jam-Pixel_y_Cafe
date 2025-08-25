extends Node2D

signal player_hitted

func _on_jugador_player_hitted():
	emit_signal("player_hitted")
