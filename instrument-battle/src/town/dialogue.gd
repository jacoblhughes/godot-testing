extends CanvasLayer

var text_to_say : Array = ["Okay, good luck.","Get 3 diamonds"]
var i=0
var can_progress=false
var first_encounter = true
signal completed

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("a") and can_progress:
		_determine_progress_dialogue()
	pass
	
func trigger():
	_determine_what_dialogue()
	_determine_progress_dialogue()

func 	_determine_what_dialogue():
	if PlotManager.has_instrument == false:
		text_to_say = ["Find a way to fight, dummy"]
	else:
		text_to_say = ["Okay, good luck.","Get 3 diamonds"]
		_determine_progress_dialogue()

func _determine_progress_dialogue():

	if i>=text_to_say.size():
		visible=true
		can_progress = false
		%Label.text = text_to_say[text_to_say.size()-1]
		await get_tree().create_timer(2.0).timeout
		visible=false
		can_progress = true
		completed.emit()
		return
	else:
		_progress_dialogue()

func _progress_dialogue():

	visible=true
	can_progress = false

	%Label.text = text_to_say[i]
	i += 1

	await get_tree().create_timer(3.0).timeout
	can_progress = true
	
