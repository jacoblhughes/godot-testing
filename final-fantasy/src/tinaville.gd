extends Node2D

@onready var map : Sprite2D = $Sprite2D
@onready var player : CharacterBody2D = $Player


func _ready():
	var map_size = map.get_rect()
	player.setCameraLimits(0, (map_size.size.x), 0,(map_size.size.y))
