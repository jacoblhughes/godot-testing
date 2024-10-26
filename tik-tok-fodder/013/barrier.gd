extends AnimatableBody3D
var start_position : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	start_position=global_position
	var wait_time = randf_range(0.0,1)
	await get_tree().create_timer(wait_time).timeout
	var tween = create_tween()
	tween.finished.connect(_on_tween_finished)
	tween.tween_property(self,"global_position",Vector3(-start_position.x,start_position.y,start_position.z),1)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_tween_finished():
	var tween = create_tween()
	tween.finished.connect(_on_tween_start_again)
	tween.tween_property(self,"global_position",start_position,1)
	pass

func _on_tween_start_again():
	var tween = create_tween()
	tween.finished.connect(_on_tween_finished)
	tween.tween_property(self,"global_position",Vector3(-start_position.x,start_position.y,start_position.z),1)
