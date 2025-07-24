extends Area2D
class_name enemy
@export var speed = 200
@export var damage =1


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
		body.health -= damage
		body.taking_dam()
	
	
	
	
	
	
	
	
