extends Node2D

@onready var UI : CanvasLayer = %UI
@onready var upgrade : CanvasLayer = %Upgrade
@onready var reset : CanvasLayer = %Reset
@onready var ball : RigidBody2D = %Ball
@onready var starting_marker : Marker2D = %StartingMarker
@export var coins : int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	for item in get_tree().get_nodes_in_group("treasure"):
		if item is Coin008:
			item.coin_touched.connect(_on_coin_touched)
	UI.update_coins(coins)
	UI.upgrade_pressed.connect(_on_upgrade_pressed)
	reset.relaunch.connect(_on_reset_relaunch)
	ball.round_over.connect(_on_round_over)
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
	UI.update_coins(1)

func _on_upgrade_pressed():
	var visibility = upgrade.visible
	upgrade.visible = !visibility

func _on_round_over():
	reset.reset_show()
	
func _on_reset_relaunch():
	ball.freeze=true
	ball.global_position = starting_marker.global_position
	ball.rotation = 0
	ball.freeze=false
