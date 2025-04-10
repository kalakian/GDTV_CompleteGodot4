extends Node2D

var lives = 3
var score = 0

@onready var player = $Player
@onready var enemy_container = $Enemies

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


func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_container.add_child(enemy_instance, true)
	enemy_instance.died.connect(_on_enemy_died)


func _on_enemy_died():
	score += 100
	print("Score: ", score)
