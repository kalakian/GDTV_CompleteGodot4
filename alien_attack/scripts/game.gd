extends Node2D

var lives = 3
var score = 0

@export var gos_scene : PackedScene
@export var game_over_delay = 1.5

@onready var player = $Player
@onready var enemy_container = $Enemies

@onready var ui = $UI
@onready var hud = $UI/HUD

@onready var enemy_hit_sound = $EnemyHitSound
@onready var player_damage_sound = $PlayerDamageSound

func _ready():
	hud.set_score_label(0)
	hud.set_lives(lives)


func _on_deathzone_area_entered(area):
	area.queue_free()


func _on_player_took_damage():
	lives -= 1
	hud.set_lives(lives)
	
	player_damage_sound.play()
	
	if lives == 0:
		game_over()


func game_over():
	player.die()
	
	await get_tree().create_timer(game_over_delay).timeout
	
	var gos = gos_scene.instantiate()
	gos.set_score(score)
	ui.add_child(gos, true)


func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_container.add_child(enemy_instance, true)
	enemy_instance.died.connect(_on_enemy_died)


func _on_enemy_died():
	score += 100
	hud.set_score_label(score)
	
	enemy_hit_sound.play()
