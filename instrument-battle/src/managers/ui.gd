extends CanvasLayer

<<<<<<< HEAD
@onready var arena = %MoneyValue
=======
@onready var money_value = %MoneyValue
>>>>>>> e8c9c3347f2def9674f039cbef49f1ca82c0878f


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
