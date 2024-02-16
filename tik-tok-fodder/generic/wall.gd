extends StaticBody2D
class_name Wall

#@export var distance_from_node2d = -128
#@onready var static_body_2d : StaticBody2D = $StaticBody2D
func _ready():
#	static_body_2d.position.y = distance_from_node2d
	pass

func _process(_delta):
	pass
	
func change_color(new_color):
	%ColorRect.color = new_color
