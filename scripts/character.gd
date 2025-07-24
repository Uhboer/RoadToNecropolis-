extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0

@onready var sprite = $Sprite2D

@onready var starting = $CanvasLayer/starting


@export var max_health = 5
@export var health = 5

@onready var status = $CanvasLayer/ui/status
@onready var score =$CanvasLayer/ui/score
@onready var rec_score = $CanvasLayer/ui/rec_score


@onready var weapon_system = $weapon_system

var shock = "res://shaders/shock.gdshader"

func _ready() -> void:
	pass
	sprite.material.set_shader_parameter("work", false)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	Global.score += delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	
	if health <= 0:
		death()


	startings(delta)
	status_update()
	move_and_slide()

func status_update():
	status.text = str('HEALTH: ', health, '/', max_health)
	score.text = str('SCORE: ', int(Global.score))
	rec_score.text = str('RECORD SCORE: ', int(Global.record_score))




func _on_jump_pressed() -> void:
	if is_on_floor():
		velocity.y = JUMP_VELOCITY


func death():
	$CanvasLayer/ui.visible = false
	$CanvasLayer/deathscreen.visible = true
	save_score()
	get_tree().paused = true

func save_score():
	var file = FileAccess.open(Global.score_save, FileAccess.WRITE)
	file.store_var(Global.record_score)
	print('score saved')



#func _on_detector_area_entered(area: Area2D) -> void:
	#if area.name == "spike"or area.name=="soulbreaker"or area.name =="enemy":
	#pass
	#print("COLLIDE")
	#sprite.material.set_shader_parameter("work", true)
	#await get_tree().create_timer(0.8).timeout
	#sprite.material.set_shader_parameter("work", false)
	#print("work")

func startings(delta):
	starting.visible=true
	starting.color.a -= 0.5 * delta

func _on_use_pressed() -> void:
	weapon_system.use()

func taking_dam():
	print("COLLIDE")
	sprite.material.set_shader_parameter("work", true)
	await get_tree().create_timer(0.8).timeout
	sprite.material.set_shader_parameter("work", false)
	print("canwork")
	
	
