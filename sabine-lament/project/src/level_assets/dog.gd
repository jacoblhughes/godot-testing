extends Trap
class_name Dog

@export var dog_texture: CompressedTexture2D = preload("res://textures/dog_walk_1.png")
@onready var sprite = $Area2D/Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.texture = dog_texture
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
