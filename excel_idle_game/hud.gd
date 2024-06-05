extends CanvasLayer

@export var cell_tile_map : TileMap
@export var units_control : Control
@export var test_label_scene : PackedScene

var hud_label_presets = ["Lumber","0","Water","0"]

# Called when the node enters the scene tree for the first time.
func _ready():
	var i = 0
	for node in range(hud_label_presets.size()):
		#node.global_position = cell_tile_map.to_global(cell_tile_map.map_to_local(Vector2i(2+i,0)))
		var test_scene = test_label_scene.instantiate()
		test_scene.global_position = cell_tile_map.to_global(cell_tile_map.map_to_local(Vector2i(2+i,0)))
		test_scene.set_label(hud_label_presets[i])
		units_control.add_child(test_scene)
		i+=1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
