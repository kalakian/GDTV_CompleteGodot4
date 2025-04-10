extends Control

@onready var score = $Score

func set_score_label(new_score):
	$Score.text = "Score: " + str(new_score)
