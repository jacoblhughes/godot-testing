extends Node2D

@onready var npc_ray_detection : RayCast2D = $NPC
var npc_detect =  null
var current_npc_detect = null
# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.wait_time = 2.0 # Set the timer for 5 seconds
	add_child(timer)
	timer.timeout.connect(_on_timeout)
	timer.start()
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

func _on_timeout():
	print("current: ",current_npc_detect,"  npc: ",npc_detect)
