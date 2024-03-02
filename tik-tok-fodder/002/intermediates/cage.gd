#extends StaticBody2D
extends Starter002

@export var conveyor : StaticBody2D
@export var belt : Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	print("cage: ",self.get_class())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):

	if body is Starter002:
		%AnimatedSprite2D.play("default")
		if conveyor:
			conveyor.run_conveyor()
		if belt:
			var animation_player = belt.get_node("AnimationPlayer")
			animation_player.play("run")
		pass # Replace with function body.
