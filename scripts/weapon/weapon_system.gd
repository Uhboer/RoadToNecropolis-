extends Node

@onready var current_weapon
@onready var weapon_list 
@onready var sword_scene = preload("res://scenes/weapons/sword.tscn")
@onready var spear_scene = preload("res://scenes/weapons/spear.tscn")
@onready var knife_scene = preload("res://scenes/weapons/knife.tscn")
@onready var axe_scene = preload("res://scenes/weapons/axe.tscn")
@onready var rifle_scene = preload("res://scenes/weapons/rifle.tscn")
@onready var sniper_scene = preload("res://scenes/weapons/sniper.tscn")
@onready var pistol_scene = preload("res://scenes/weapons/pistol.tscn")
@onready var revolver_scene = preload("res://scenes/weapons/revolver.tscn")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func use():
	if current_weapon:
		current_weapon.use()

func take_weapon(id:int):
	if !current_weapon:
		print("new weapon taken")
		var new_weapon
		if id ==1:
			new_weapon = sword_scene.instantiate()
		if id ==2:
			new_weapon=spear_scene.instantiate()
		if id ==3:
			new_weapon=knife_scene.instantiate()
		if id==4: new_weapon=axe_scene.instantiate()
		if id==5: new_weapon=rifle_scene.instantiate()
		if id==6: new_weapon=sniper_scene.instantiate()
		if id==7: new_weapon=pistol_scene.instantiate()
		if id==8: new_weapon=revolver_scene.instantiate()
		
		
		
		add_child(new_weapon)
		current_weapon = new_weapon
	else:
		print("you already have a weapon")










#
