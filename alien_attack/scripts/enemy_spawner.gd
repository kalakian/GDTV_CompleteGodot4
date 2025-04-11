extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy_instance)

@export var enemy_scene : PackedScene
@export var path_enemy_scene : PackedScene

@onready var spawn_positions = $SpawnPositions

func _on_timer_timeout():
	spawn_enemy()


func spawn_enemy():
	var spawn_positions_array = spawn_positions.get_children()
	var random_spawn_position = spawn_positions_array.pick_random()
	
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_spawn_position.global_position
	enemy_spawned.emit(enemy_instance)


func _on_path_enemy_spawn_timer_timeout():
	spawn_path_enemy()


func spawn_path_enemy():
	var enemy_instance = path_enemy_scene.instantiate()
	path_enemy_spawned.emit(enemy_instance)
