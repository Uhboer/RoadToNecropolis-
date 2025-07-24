extends Control

@onready var results = $results
@onready var ending = $ending
var end=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	results.text = str('score: ', int(Global.score), '\n',
	'record score: ', int(Global.record_score))
	
	if end:
		ending.color.a += 0.8 * delta
		
	
	
	


func _on_to_menu_pressed() -> void:
	end=true
	await get_tree().create_timer(1.8).timeout
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
