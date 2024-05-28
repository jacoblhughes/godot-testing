extends Area2D

var type = 0
var direction = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	input_event.connect(_on_input_event)
	body_entered.connect(_on_body_entered)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):

	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		type +=1
		print(type)
		if type == 1:
			direction = Vector2(-1,0)
		if type == 2:
			direction = Vector2(1,0)

	pass # Replace with function body.


func _on_body_entered(body):
	if body is CharacterBody2D:
		body.direction = direction
	pass # Replace with function body.
