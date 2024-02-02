extends Enemy

@export var ghost_speed = 100.0

func _ready():
	speed = ghost_speed
	add_to_group("enemies")
