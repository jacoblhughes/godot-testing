extends CharacterBody2D
class_name Enemy
@export var health = 3
@export var fade_scene : PackedScene
@export var treasure_scene : PackedScene
@onready var player = get_parent().get_parent().get_node("Player")
var speed
signal treasure_drop
func _ready():

	pass

func take_damage(amount):
	health -= amount
	if health == 0:
		fade_away()
		var treasure = treasure_scene.instantiate()
	#	get_parent().add_child(treasure)
		treasure_drop.emit(global_position,treasure)

func _physics_process(delta):
	var player_position = player.global_position
	var direction = global_position.direction_to(player_position)
	velocity = direction * speed
	move_and_slide()

func fade_away():
	queue_free()                         
#	const SMOKE_SCRENE = preload("res://src/enemies/ghost_smoke.tscn")
	var fade = fade_scene.instantiate()
	get_parent().add_child(fade)
	fade.global_position = global_position
#	treasure.global_position = global_position
