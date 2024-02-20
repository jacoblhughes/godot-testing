extends Node2D

@export var trumpet_scene : PackedScene
@export var bagpipes_scene : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is Player:
		var instrument = trumpet_scene.instantiate()
		body.add_child.call_deferred(instrument)
		queue_free()
		PlotManager.set_has_instrument(true)
	pass # Replace with function body.


func _on_area_2d_2_body_entered(body):

	if body is Player:
		var instrument = bagpipes_scene.instantiate()
		body.add_child.call_deferred(instrument)
		queue_free()
		PlotManager.set_has_instrument(true)
	pass # Replace with function body.
