extends CanvasLayer

@export var text_to_say = ["Okay, good luck.","Get 3 diamonds"]
var i=0
var can_progress=false
var first_encounter = true
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("a") and can_progress:
		_determine_progress_dialogue()
	pass
	
func trigger():
	_determine_progress_dialogue()

func _determine_progress_dialogue():
	if i>=text_to_say.size():
		%Label.text = text_to_say[text_to_say.size()-1]
		await get_tree().create_timer(1.5).timeout
		visible=false
		return
	else:
		_progress_dialogue()

func _progress_dialogue():
	print('preogres')
	can_progress = false

	%Label.text = text_to_say[i]
	i += 1

	await get_tree().create_timer(1.5).timeout
	can_progress = true
	
