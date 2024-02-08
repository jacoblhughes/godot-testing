extends Node2D

const DEADZONE = .25
var can_blast = true
@onready var attack_animation : AnimationPlayer = $AnimationPlayer
@onready var blast_area : Area2D = $Blast
var enemies_list = []
var damage_amount = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	attack_animation.animation_finished.connect(_on_attack_finished)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var controller_x =  Input.get_joy_axis(0,JOY_AXIS_RIGHT_X)
	var controller_y =  Input.get_joy_axis(0,JOY_AXIS_RIGHT_Y)
	
	if(abs(controller_x) > DEADZONE or abs(controller_y) >DEADZONE):
		rotation = (Vector2(controller_x,controller_y)).angle()
		
	if Input.is_action_just_pressed("rt") and can_blast:
		attack_animation.play("blast")
		enemies_list=[]
		can_blast = false
	pass

func _on_attack_finished(anim_name: String):
	if anim_name == "blast":
		attack_animation.play("RESET")
		can_blast = true
	pass


func _on_blast_body_entered(body):
	if body is Enemy and not enemies_list.has(body):
		enemies_list.append(body)
		if body.has_method('take_damage'):
			body.take_damage(damage_amount)
	pass # Replace with function body.
