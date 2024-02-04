extends CanvasLayer

@onready var arena = get_node("Arena")
@onready var arena_score = get_node("Arena/MarginContainer/GridContainer/Score")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func set_arena_score(value):
	arena_score.text = str(value)
	pass
