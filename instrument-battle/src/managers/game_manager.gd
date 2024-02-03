extends Node

var score = 0
@onready var score_label : Label = UI.get_node("Label")

# Called when the node enters the scene tree for the first time.
func _ready():
#	print(score_label)
	pass # Replace with function body.

func _process(delta):
	pass

func add_score(value):
	score+=value
	set_score()
	
func change_score(value):
	score=value
	set_score()
	
func set_score():
	score_label.text = str(score)
	pass

func return_score():
	return score
