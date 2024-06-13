extends CanvasLayer

@export var cell_tile_map : TileMap
@export var units_control : Control
@export var hud_label_scene : PackedScene
var profit_score : Control
var hud_label_presets = {
	"ProfitLabel": {"name": "ProfitLabel", "starting_text": "Profit"},
	"ProfitScore": {"name": "ProfitScore", "starting_text": "0"}
	# You can add more entries here as needed
}

# Called when the node enters the scene tree for the first time.
func _ready():
	var i = 0
	for key in hud_label_presets.keys():
		var label_name = hud_label_presets[key].name
		var label_starting_text = hud_label_presets[key].starting_text
		var hud_label = hud_label_scene.instantiate()
		hud_label.global_position = cell_tile_map.to_global(cell_tile_map.map_to_local(Vector2i(2 + i, 0))) - Vector2(hud_label.get_label_size().x/2,0)
		hud_label.name = label_name
		hud_label.set_label(label_starting_text)
		if label_name == "ProfitScore":
			profit_score = hud_label
		units_control.add_child(hud_label)
		i += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_score(val):
	profit_score.set_label(val)
	pass
