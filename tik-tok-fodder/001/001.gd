extends Node2D

var sound_files = ["res://sounds/C.wav", "res://sounds/E.wav", "res://sounds/G.wav", "res://sounds/C2.wav"]
var wall_elements
var ball_elements
var grav_elements
var ball_instance_scene = preload("res://generic/ball.tscn")
var trail : Array = []
# Called when the node enters the scene tree for the first time.
func _ready():
	wall_elements = get_tree().get_nodes_in_group("wall")
	load_sounds_and_assign_to_walls()
	
	ball_elements = get_tree().get_nodes_in_group("ball")
	
	for element in ball_elements:
		element.wall_collision_and_split.connect(_on_wall_collision_and_split)
		element.add_position_to_trail.connect(_on_add_position_to_trail)
		pass
		
	grav_elements = get_tree().get_nodes_in_group("gravity")



		
		
	for i in len(grav_elements):
		print(i)
		var collision_shape = grav_elements[i].get_node("CollisionShape2D")
		print(collision_shape)
		if i==0:
			grav_elements[i].set_gravity_point_center(Vector2(collision_shape.shape.get_rect().size.x/2,collision_shape.shape.get_rect().size.y/2))
			print(grav_elements[i].get_gravity_point_center())
		elif i==1:
			grav_elements[i].set_gravity_point_center(Vector2(collision_shape.shape.get_rect().size.x/2,collision_shape.shape.get_rect().size.y/4))
			print(grav_elements[i].get_gravity_point_center())
			
func _on_wall_collision_and_split(pos,vel,split_value,splits):
	var ball_instance = ball_instance_scene.instantiate()
	await get_tree().create_timer(splits).timeout
	ball_instance.position = pos
	ball_instance.linear_velocity = vel
	ball_instance.wall_collision_and_split.connect(_on_wall_collision_and_split)
	ball_instance.add_position_to_trail.connect(_on_add_position_to_trail)
	ball_instance.hit_wall_speed_up = true
	add_child.call_deferred(ball_instance,true)

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

func _process(_delta):
	if(trail.size() >=1):
		queue_redraw()

func _on_add_position_to_trail(ball_position,ball_color,this_texture,this_scale):
	trail.append({"pos": ball_position, "color": ball_color,"texture":this_texture,"this_scale":this_scale})

