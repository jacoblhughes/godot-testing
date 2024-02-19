extends Node2D

var ghost_enemy = preload("res://src/enemies/ghost.tscn")
var ghost_enemy_scene
@export var wait_time = 2.0
@onready var treasure_node = $"../Treasure"
var enemy_spawn_timer



func start_timer():
	enemy_spawn_timer.start()            # Start the timer
# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_spawn_timer = Timer.new()  # Create a new timer
	enemy_spawn_timer.wait_time = wait_time    # Set the timer to 1 second
	add_child(enemy_spawn_timer)
	enemy_spawn_timer.timeout.connect(_on_timer_timeout)
	get_parent().arena_finished.connect(_on_arena_finished)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	ghost_enemy_scene = ghost_enemy.instantiate()
	%PathFollow2D.progress_ratio = randf()
	
	add_child(ghost_enemy_scene,true)
	ghost_enemy_scene.treasure_drop.connect(_on_treasure_drop)
	ghost_enemy_scene.fade_away_signal.connect(_on_enemy_fade_away)
	ghost_enemy_scene.global_position = %PathFollow2D.global_position

func _on_treasure_drop(drop_position,scene):
	treasure_node.add_child.call_deferred(scene)
	scene.global_position = drop_position

func _on_arena_finished():
	enemy_spawn_timer.stop()

func _on_enemy_fade_away():
	get_parent()._add_kill()
