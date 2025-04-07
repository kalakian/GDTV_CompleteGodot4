extends Node2D

var lives = 3

@onready var player = $Player

func _on_deathzone_area_entered(area):
	area.die()


func _on_player_took_damage():
	lives -= 1
	if lives == 0:
		game_over()
	else:
		print(lives, " lives remaining")

func game_over():
	print("Game Over!")
	player.die()
