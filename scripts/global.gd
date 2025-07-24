extends Node

var score_save = "user://score.save"
var money_save = "user://money.save"
#var retribution:int = 0

var money = 0

var score = 0
var record_score= 0
func _physics_process(delta: float) -> void:
	if score >= record_score:
		record_score = score
