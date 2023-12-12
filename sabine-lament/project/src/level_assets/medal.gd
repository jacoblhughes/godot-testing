extends Node2D

signal medal_obtained
@export var level : int = 1
@export var medal_text : String = "Double Jump"
@export var medal_instructions : String = "Press Jump Twice"
@onready var medal_label = $Area2D/Label
@onready var medal_instructions_label = $Area2D/Label2
# Called when the node enters the scene tree for the first time.
func _ready():
	medal_label.text = medal_text
	medal_instructions_label.text = medal_instructions
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	body.unlock_power(level)
	queue_free()
	pass # Replace with function body.
