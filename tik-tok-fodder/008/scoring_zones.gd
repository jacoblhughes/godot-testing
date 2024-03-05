extends Node2D


var scoring_area_scene = preload("res://008/score.tscn")
var scoring_first_position = Vector2(768, 832)  # Add more positions as needed
var scoring_value = 100  # Corresponding score values for each position
var number_of_scoring_sections = 85

var green_shades = [
	Color(0.0, 0.5, 0.0, 1.0),  # Dark Green
	Color(0.0, 0.6, 0.0, 1.0),  # Medium Dark Green
	Color(0.0, 0.7, 0.0, 1.0),  # Medium Green
	Color(0.0, 0.8, 0.0, 1.0),  # Medium Light Green
	Color(0.0, 0.9, 0.0, 1.0),  # Light Green
	Color(0.2, 1.0, 0.2, 1.0),  # Lighter Green
	Color(0.4, 1.0, 0.4, 1.0),  # Pale Green
	Color(0.6, 1.0, 0.6, 1.0),  # Paler Green
	Color(0.8, 1.0, 0.8, 1.0),  # Very Pale Green
	Color(0.9, 1.0, 0.9, 1.0)   # Almost White Green
]


func _ready():
	for i in range(number_of_scoring_sections):
		var scoring_area = scoring_area_scene.instantiate()
		add_child(scoring_area)
		scoring_area.global_position = Vector2(scoring_first_position.x + i*scoring_area.width,scoring_first_position.y)
		scoring_area.value = scoring_value * (i+1)
		scoring_area.ground_text.text = str(scoring_value * (i+1))
		scoring_area.value_achieved.connect(_on_value_acheieved)
		var color_rect = scoring_area.ground_color  # Adjust the path if necessary
		color_rect.color = green_shades[i % green_shades.size()]  # Example: Gradually decrease the red component
		
func _on_value_acheieved(value):
	get_parent().update_score(value)

