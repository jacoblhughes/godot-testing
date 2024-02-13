extends Node2D

@onready var arena_portal = $Arena

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _on_npc_interaction():
	arena_portal.turn_on_portal()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
