extends Node2D

@export var trail = []
var my_size : Vector2 = Vector2(16,16)
var timer_node : Timer
var balls

var random_color
var music_notes

var sound_files = ["res://sounds/C.wav", "res://sounds/E.wav", "res://sounds/G.wav", "res://sounds/C2.wav"]
var wall_elements : Array
var ball_elements: Array
var shooting_ball_scene = preload("res://shooting_ball/shooting_ball.tscn")
var shooting_ball_instance
var grav_elements: Array
var collision_shape: CollisionShape2D
func _ready():
	wall_elements = get_tree().get_nodes_in_group("wall")
	load_sounds_and_assign_to_walls()
	ball_elements = get_tree().get_nodes_in_group("ball")
	for element in ball_elements:
		element.wall_collision.connect(_on_wall_collision)
	grav_elements = get_tree().get_nodes_in_group("gravity")
	
	for i in len(grav_elements):
		print(i)
		collision_shape = grav_elements[i].get_node("CollisionShape2D")
		print(collision_shape)
		if i==0:
			grav_elements[i].set_gravity_point_center(Vector2(collision_shape.shape.get_rect().size.x/2,collision_shape.shape.get_rect().size.y/2))
			print(grav_elements[i].get_gravity_point_center())
		elif i==1:
			grav_elements[i].set_gravity_point_center(Vector2(collision_shape.shape.get_rect().size.x/2,collision_shape.shape.get_rect().size.y/4))
			print(grav_elements[i].get_gravity_point_center())
func load_sounds_and_assign_to_walls():
	for i in range(wall_elements.size()):
		var sound_index = i % sound_files.size()
		var sound = load(sound_files[sound_index])
		if sound:
			var audio_player = AudioStreamPlayer.new()
			audio_player.stream = sound
			wall_elements[i].add_child(audio_player,true)
		else:
			print("Failed to load sound:", sound_files[sound_index])
			
func _draw():
	for point in trail:
		draw_texture_rect(point["texture"],Rect2(point["pos"]-(point["texture"].get_size()*point["this_scale"]/2),point["texture"].get_size()*point["this_scale"]),false,point["color"])

func add_position_info(ball_position,ball_color,this_texture,this_scale):
	trail.append({"pos": ball_position, "color": ball_color,"texture":this_texture,"this_scale":this_scale})

func _process(_delta):
	if(trail.size() >1):
		queue_redraw()
	pass

func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()

func _on_wall_collision(this_position,this_velocity):
	shooting_ball_instance = shooting_ball_scene.instantiate()
	shooting_ball_instance.position = this_position
	shooting_ball_instance.linear_velocity = -this_velocity
#	if not shooting_ball_instance.has_method("_on_wall_collision"):
#		shooting_ball_instance.wall_collision.connect(_on_wall_collision)
	add_child.call_deferred(shooting_ball_instance,true)
	
	
extends RigidBody2D


@onready var game = get_parent()
var sprite : Sprite2D
var timer_node
signal wall_collision(current_position,current_velocity)
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
		sprite.modulate = random_color
		this_scale = sprite.scale
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
#		linear_velocity *= 1.05
#		wall_collision.emit(position,linear_velocity)
	pass
