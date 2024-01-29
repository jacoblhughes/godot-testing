extends Node2D

var ghost_enemy = preload("res://src/enemies/ghost.tscn")
var ghost_enemy_scene

@onready var treasure_node = $"../Treasure"
# Called when the node enters the scene tree for the first time.
func _ready():
	var enemy_spawn_timer = Timer.new()  # Create a new timer
	enemy_spawn_timer.wait_time = 1.0    # Set the timer to 1 second
	add_child(enemy_spawn_timer)
	enemy_spawn_timer.start()            # Start the timer
	enemy_spawn_timer.timeout.connect(_on_timer_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	ghost_enemy_scene = ghost_enemy.instantiate()
	add_child(ghost_enemy_scene,true)
	ghost_enemy_scene.treasure_drop.connect(_on_treasure_drop)
	ghost_enemy_scene.global_position = %EnemySpawnMarker.global_position

func _on_treasure_drop(drop_position,scene):
	treasure_node.add_child.call_deferred(scene)
	scene.global_position = drop_position
