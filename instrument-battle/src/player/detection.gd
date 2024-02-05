extends Node2D

@onready var npc_ray_detection : RayCast2D = $NPC
var npc_detect =  null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if npc_detect == null and npc_ray_detection.is_colliding():
		npc_detect = npc_ray_detection.get_collider()
		print(npc_detect)
		if npc_detect.name == "NPC":
			npc_detect.being_viewed_function()
		pass
	elif npc_detect != null and !npc_ray_detection.is_colliding():
		npc_detect.stop_viewed_function()
		npc_detect = null
		pass
