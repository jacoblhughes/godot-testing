extends CanvasLayer

@onready var arena = %MoneyValue


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func set_arena_score(value):
	%MoneyValue.text = str(value)
	pass

func set_arena_enemies_left(value):
	%EnemyCountLeft.text = str(value)
	pass
