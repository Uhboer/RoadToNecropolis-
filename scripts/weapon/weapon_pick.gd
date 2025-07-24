extends Area2D
@export var speed = 200
@export var prop_id = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta
	if position.x <= -350:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.name == "character":
		body.weapon_system.take_weapon(prop_id)
