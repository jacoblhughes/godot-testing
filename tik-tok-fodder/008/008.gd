extends Node2D

@onready var UI : CanvasLayer = %UI
@onready var upgrade_canvas : CanvasLayer = %Upgrade
@onready var reset_canvas : CanvasLayer = %Reset
@onready var ball : RigidBody2D = %Ball
@onready var starting_marker : Marker2D = %StartingMarker
@export var coins : int = 0
@onready var golf_club : Area2D = %GolfClub
var reset = false
signal coin_update
# Called when the node enters the scene tree for the first time.
func _ready():
	for item in get_tree().get_nodes_in_group("treasure"):
		if item is Coin008:
			item.coin_touched.connect(_on_coin_touched)
	UI.update_coins(coins)
	UI.upgrade_pressed.connect(_on_upgrade_pressed)
	reset_canvas.relaunch.connect(_on_reset_relaunch)
	reset_canvas.visibility_changed.connect(_on_visibile_change)
	ball.round_over.connect(_on_round_over)
	upgrade_canvas.weight_upgrade.connect(_on_weight_upgrade)
	upgrade_canvas.impulse_upgrade.connect(_on_impulse_upgrade)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if %Ball.global_position.x > %DistanceMarker.global_position.x:
		update_distance(floor((%Ball.global_position.x - %DistanceMarker.global_position.x)/6.4))
	if reset == true:
		ball.freeze=true
		ball.global_position = starting_marker.global_position
		ball.rotation = 0
		ball.freeze=false
		reset_canvas.call_deferred("reset_hide") 
		reset = false
		
	pass
func _on_visibile_change():
	printerr("CHANGED")

func update_score(value):
	UI.update_score(value)

func update_distance(value):
	UI.update_distance(value)

func _on_coin_touched():
	coins+=1
	UI.update_coins(coins)
	coin_update.emit(coins)

func _on_upgrade_pressed():
	var visibility = upgrade_canvas.visible
	upgrade_canvas.visible = !visibility
	print('var')
	
func _on_round_over():
	reset_canvas.reset_show()

	
func _on_reset_relaunch():
	reset = true
	%Ball.braked = false

func _on_weight_upgrade():
	var current_mass = ball.mass
	ball.mass = current_mass/2

func _on_impulse_upgrade():
	var current_punch = golf_club.punch
	golf_club.punch = current_punch*4
