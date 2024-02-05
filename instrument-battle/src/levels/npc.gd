extends Node2D

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var character : CharacterBody2D = $NPC
var player_view = false
# Called when the node enters the scene tree for the first time.
func _ready():
	print(sprite.material)
	character.being_viewed.connect(_on_being_viewed)
	character.stop_viewed.connect(_on_stop_viewed)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is Player and player_view:
		sprite.material.set_shader_parameter("line_thickness", 1.0)

func _on_being_viewed():
	player_view=true


func _on_stop_viewed():
	sprite.material.set_shader_parameter("line_thickness", 0.0)
	print('heeeeeeeeeeeeeeeeeeeeee')
	player_view=false
#	sprite.material.set_shader_parameter("line_thickness", 0.0)
