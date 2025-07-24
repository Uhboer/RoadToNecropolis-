extends Node
class_name WeaponBase
@export var damage = 1
@export var cd = 0.5
@export var long = 1.0
@export var usings = 5

@export var id = 0

var using =false
var canuse =true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	del()
	arcing()
	info_usings()
func info_usings():
	pass


func use():
	if canuse && usings > 0:
		canuse =false
		using =true
		await get_tree().create_timer(long).timeout
		using =false
		usings-= 1

		#couldown na kastile
		await get_tree().create_timer(cd).timeout
		canuse =true
	

func arcing():
	pass

func del():
	if usings <=0:
		queue_free()
