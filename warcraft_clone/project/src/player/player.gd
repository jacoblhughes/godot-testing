extends CharacterBody2D
@export var unit_1 : PackedScene
@export var unit_2 : PackedScene
@export var timer : Timer

func _enter_tree():
	set_multiplayer_authority(name.to_int(),true)

func _ready():
	timer.timeout.connect(_on_timer_timeout)
	timer.start()

func _physics_process(delta):
	if is_multiplayer_authority():
		velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * 400

	move_and_slide()

#func _on_timer_timeout():
	#print()
	#var spawn_position = global_position + Vector2(0,10)
	#var unit = unit_1.instantiate()
	#unit.global_position = spawn_position
	#unit.direction = Vector2(1,1)
	#unit.set_multiplayer_authority(name.to_int(),true)
	#get_parent().call_deferred("add_child",unit,true)
func _on_timer_timeout():
	var player_id = name.to_int()  # Convert node name to player ID
	if GameManager.Players.has(player_id):
		var role = GameManager.Players[player_id].role
		print("Spawning for: ", role, " (ID: ", player_id, ")")

		var spawn_position = global_position + Vector2(0, 10)
		var unit

		if role == "Player 1":
			unit = unit_1.instantiate()
			unit.direction = Vector2(1, 1)
		else:
			unit = unit_2.instantiate()
			unit.direction = Vector2(-1, -1)

		unit.global_position = spawn_position
		unit.set_multiplayer_authority(player_id, true)

		get_parent().call_deferred("add_child", unit, true)
	else:
		print("Player ID ", player_id, " not found in GameManager.Players.")
