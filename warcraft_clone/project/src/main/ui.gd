extends CanvasLayer
@export var base_button : Button

signal base_being_placed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	base_button.pressed.connect(_on_base_button_pressed)
	pass # Replace with function body.

# Button click event to start placing the base
func _on_base_button_pressed():
	base_being_placed.emit()
