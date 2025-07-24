extends Node2D

@export var spike_scene: PackedScene = preload("res://scenes/mobs/spike.tscn")
@export var soulbracker_scene: PackedScene =  preload("res://scenes/mobs/soulbreaker.tscn")
@export var sniffer_scene: PackedScene =  preload("res://scenes/mobs/sniffer.tscn")




@export var sword_scene: PackedScene = preload("res://scenes/weapons/sword_prop.tscn")
@export var spear_scene: PackedScene = preload("res://scenes/weapons/spear_prop.tscn")
@export var knife_scene: PackedScene = preload("res://scenes/weapons/knife_prop.tscn")
@export var axe_scene: PackedScene = preload("res://scenes/weapons/axe_prop.tscn")
@export var rifle_scene: PackedScene = preload("res://scenes/weapons/rifle_prop.tscn")
@export var sniper_scene: PackedScene = preload("res://scenes/weapons/sniper_prop.tscn")
@export var pistol_scene: PackedScene = preload("res://scenes/weapons/pistol_prop.tscn")
@export var revolver_scene: PackedScene = preload("res://scenes/weapons/revolver_prop.tscn")




@onready var character = $character

@onready var pb = $ParallaxBackground

var spawn_timer = 0.0
var spawn_interval = 1.5


func _physics_process(delta):
	spawn_timer += delta
	if spawn_timer >=  spawn_interval:
		spawn_timer = 0.0
		generation()



func generation():
	var enemy_type = randi_range(0, 3)
	print(enemy_type)
	var enemy_scene:PackedScene
	if enemy_type == 0:
		print("spike generated")
		enemy_scene = spike_scene
	if enemy_type == 1:
		print("soulbreaker generated")
		enemy_scene = soulbracker_scene
	if enemy_type==2:
		enemy_scene = sniffer_scene
	if enemy_type == 3:
		print("weapon generated")
		var weapon_type = randi_range(0,7)
		if weapon_type == 0:
			enemy_scene = sword_scene
		if weapon_type == 1:
			enemy_scene = spear_scene
		if weapon_type ==2:
			enemy_scene=knife_scene
		if weapon_type ==3:
			enemy_scene=axe_scene
		if weapon_type==4:
			enemy_scene=rifle_scene
		if weapon_type==5:
			enemy_scene=sniper_scene
		if weapon_type==6: enemy_scene=pistol_scene
		if weapon_type==7: enemy_scene=revolver_scene
		
	
	
	
	var enemy = enemy_scene.instantiate()
	pass
	add_child(enemy)
	enemy.name = "enemy"
	var spawn = get_viewport_rect().size
	enemy.position.x = spawn.x
	print("spawned")
	
	enemy.speed = enemy.speed + Global.score * 1.5
	pb.speed = pb.speed + Global.score / 5
	
	
	













##
