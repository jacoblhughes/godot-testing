extends Node2D

@onready var UI : CanvasLayer = %UI

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("move_right"):
		%Ball.apply_central_impulse(Vector2(250,0))
		
	if %Ball.global_position.x > %DistanceMarker.global_position.x:
		update_distance(floor((%Ball.global_position.x - %DistanceMarker.global_position.x)/8))
	pass

func update_score(value):
	UI.update_score(value)

func update_distance(value):
	UI.update_distance(value)
