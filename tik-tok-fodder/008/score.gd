extends Node2D

@export var value : int
@onready var ground_color = %Ground.get_node("ColorRect")
@onready var ground_text = %Ground.get_node("Label")
@onready var width = %Ground.get_node("CollisionShape2D").shape.size.x
# Called when the node enters the scene tree for the first time.
signal value_achieved(achieved_value)
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_scoring_area_body_entered(body):
	if body is Ball008:
		value_achieved.emit(value)
	pass # Replace with function body.
