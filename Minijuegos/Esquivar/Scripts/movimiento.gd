extends RigidBody2D
var movimientoMouse: Vector2
var posicionMouse: Vector2
@export var velocidad: float
func _ready() -> void:
	contact_monitor=true
	max_contacts_reported=1
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		movimientoMouse=event.screen_relative
		posicionMouse=event.position
		print(posicionMouse)
func _physics_process(delta: float) -> void:
	atraccionDefault(delta)

func atraccionDefault(_delta:float):
	position= lerp(position,posicionMouse,velocidad)
	


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("bala"):
		print("IMPACTO")
		body.queue_free()
		modulate=Color(1,0,0)
		await get_tree().create_timer(1.5).timeout
		modulate=Color(1,1,1)
	else:
		print("CHOCLO CON OTRA")
