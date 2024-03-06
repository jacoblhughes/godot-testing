extends Node2D

@onready var UI : CanvasLayer = %UI

# Called when the node enters the scene tree for the first time.
func _ready():
	for item in get_tree().get_nodes_in_group("treasure"):
		if item is Coin008:
			item.coin_touched.connect(_on_coin_touched)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if %Ball.global_position.x > %DistanceMarker.global_position.x:
		update_distance(floor((%Ball.global_position.x - %DistanceMarker.global_position.x)/6.4))
	pass

func update_score(value):
	UI.update_score(value)

func update_distance(value):
	UI.update_distance(value)

func _on_coin_touched():
	%UI.update_coins(1)
	
