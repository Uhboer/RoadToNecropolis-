extends WeaponBase
class_name WeaponRifle

@onready var usingstxt = $usings
@export var bullet_scene = preload("res://scenes/weapons/bullet.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	del()
	info_usings()
	fire()

func info_usings():
	usingstxt.text = str(usings)
	

func fire():
	if using:
		var bullet =bullet_scene.instantiate()
		add_child(bullet)
