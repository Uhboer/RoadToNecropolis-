extends WeaponBase
class_name WeaponSword
@onready var arc = $arc
@onready var usingstxt = $usings

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass
	del()
	info_usings()
	arcing()
	

func arcing():
	if using:
		arc.visible = true
	else:
		arc.visible = false

func info_usings():
	usingstxt.text = str(usings)
		



func _on_attack_area_entered(area: Area2D) -> void:
	if using:
		#arc.visible = true
		area.queue_free()
		using =false
