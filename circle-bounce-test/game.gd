extends Node2D

@export var trail = []
var my_size : Vector2 = Vector2(16,16)
var timer_node : Timer
var balls

var random_color
var music_notes

var sound_files = ["res://sounds/C.wav", "res://sounds/E.wav", "res://sounds/G.wav", "res://sounds/C2.wav"]
var wall_elements : Array
var new_ball = preload("res://square_ball/square_ball.tscn")


func _ready():
	wall_elements = get_tree().get_nodes_in_group("wall")
	load_sounds_and_assign_to_walls()

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
