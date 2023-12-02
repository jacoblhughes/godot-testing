extends ParallaxBackground

@export var far_texture: CompressedTexture2D = preload("res://textures/level_1/far_1.png")
@export var close_texture: CompressedTexture2D = preload("res://textures/level_1/middle_1.png")
@export var scroll_speed = 10

@onready var far_sprite = $ParallaxLayer/Sprite2D
@onready var close_sprite = $ParallaxLayer2/Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	far_sprite.texture = far_texture
	close_sprite.texture = close_texture
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	far_sprite.region_rect.position += delta * Vector2(scroll_speed,0)
	if far_sprite.region_rect.position >= Vector2(1024,0):
		far_sprite.region_rect.position = Vector2.ZERO
	pass
