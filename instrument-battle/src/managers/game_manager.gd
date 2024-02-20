extends Node

var arena_score = 0
<<<<<<< HEAD
@onready var ui_arena_score : Label = UI.arena
=======
@onready var ui_arena_score : Label = UI.money_value
>>>>>>> e8c9c3347f2def9674f039cbef49f1ca82c0878f

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("b"):
		get_tree().quit()
	elif Input.is_action_just_pressed("lt"):
		get_tree().reload_current_scene()
	pass
	pass

func add_money(value):
	arena_score+=value
	UI.set_arena_score(arena_score)
	
func change_score(value):
	arena_score=value
	UI.set_arena_score(arena_score)

func return_score():
	return arena_score
