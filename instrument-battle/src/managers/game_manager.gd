extends Node

var arena_score = 0
@onready var ui_arena_score : Label = UI.arena_score

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func _process(delta):
	pass

func add_score(value):
	arena_score+=value
	UI.set_arena_score(arena_score)
	
func change_score(value):
	arena_score=value
	UI.set_arena_score(arena_score)

func return_score():
	return arena_score
