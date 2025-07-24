extends Control

@onready var record = $main/record
@onready var credits = $credits
@onready var shop= $shop
@onready var statistic = $statistic
@onready var main = $main

@onready var starting = $starting

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_score()
	load_money()
	Global.score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	record.text = str('record: ', int(Global.record_score))
	startings(delta)

func load_score():
	if FileAccess.file_exists(Global.score_save):
		print('record save file found')
		var file = FileAccess.open(Global.score_save, FileAccess.READ)
		Global.record_score = file.get_var()
	else:
		print('record save file not found')

func load_money():
	if FileAccess.file_exists(Global.money_save):
		print("money save file found")
		var file = FileAccess.open(Global.money_save, FileAccess.READ)
		Global.money = file.get_var()
	else:
		print("money save file not found")






func _on_play_pressed() -> void:
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_credits_pressed() -> void:
	await get_tree().create_timer(0.5).timeout
	credits.visible = true
	main.visible =false


func _on_shop_pressed() -> void:
	await get_tree().create_timer(0.5).timeout
	shop.visible = true
	main.visible = false


func _on_statistic_pressed() -> void:
	await get_tree().create_timer(0.5).timeout
	statistic.visible = true
	main.visible =false




func _on_back_shop_pressed() -> void:
	await get_tree().create_timer(0.5).timeout
	shop.visible = false
	main.visible = true


func _on_back_credits_pressed() -> void:
	await get_tree().create_timer(0.5).timeout
	credits.visible =false
	main.visible =true


func _on_back_statistic_pressed() -> void:
	await get_tree().create_timer(0.5).timeout
	statistic.visible =false
	main.visible=true
	

func startings(delta):
	starting.visible =true
	starting.color.a -= 0.5 * delta
