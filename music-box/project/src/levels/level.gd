extends Node2D

@onready var start_position = $StartPosition

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#add the quit and stuff from the other one
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	pass


func _on_death_zone_body_entered(body):

	body.velocity = Vector2.ZERO
	body.global_position = start_position.global_position
	pass # Replace with function body.
