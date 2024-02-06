extends Node2D

@onready var npc_ray_detection : RayCast2D = $NPC
var npc_detect =  null
var current_npc_detect = null
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if npc_ray_detection.is_colliding():
		current_npc_detect = npc_ray_detection.get_collider()
		if current_npc_detect != null:
			current_npc_detect.being_viewed()
			npc_detect = current_npc_detect
	elif !npc_ray_detection.is_colliding() and npc_detect != null:
			npc_detect.stop_being_viewed()
