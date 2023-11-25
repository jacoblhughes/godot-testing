extends RigidBody2D


@onready var game = get_parent()
var sprite : Sprite2D
var timer_node
signal wall_collision
var random_color
var music_notes 
var note = 0
var texture
var this_scale

func _ready():
	timer_node = get_parent().get_node("Timer")
	timer_node.timeout.connect(_on_timer_timeout)
	if has_node("Sprite2D"):
		sprite = $Sprite2D
		random_color = Color(randf(), randf(), randf(), 1.0)
		texture = sprite.texture
		print(texture.get_size())
		sprite.modulate = random_color
		this_scale = sprite.scale
		print(this_scale)
		game.add_position_info(position,random_color,texture,this_scale)

func _process(_delta):
	pass

func _on_timer_timeout():

	game.add_position_info(position,random_color,texture,this_scale)
	pass

func _on_body_entered(body):
	random_color = Color(randf(), randf(), randf(), 1.0)
	body.get_node("ColorRect").color = random_color
	if body is Wall:
		body.get_node("AudioStreamPlayer").play()
		sprite.modulate = random_color
		linear_velocity *= 1.05
	pass
