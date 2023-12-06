extends ParallaxBackground

@export var far_texture: CompressedTexture2D = preload("res://textures/level_1/far_1.png")
@export var close_texture: CompressedTexture2D = preload("res://textures/level_1/middle_1.png")
@export var far_scroll_speed = Vector2(10,0)

@onready var far_sprite = $ParallaxLayer/Sprite2D
@onready var far_parallax = $ParallaxLayer
@export var far_motion = Vector2(1,1)
@export var close_motion = Vector2(1,1)
@onready var close_sprite = $ParallaxLayer2/Sprite2D
@onready var close_parallax = $ParallaxLayer2
@export var far_parallax_mirror_y = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	far_sprite.texture = far_texture
	close_sprite.texture = close_texture
	far_parallax.motion_scale = far_motion
	close_parallax.motion_scale = close_motion
	far_parallax.motion_mirroring.y = far_parallax_mirror_y
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	far_sprite.region_rect.position += delta * far_scroll_speed
	if far_sprite.region_rect.position >= Vector2(1024,0):
		far_sprite.region_rect.position = Vector2.ZERO
	pass
