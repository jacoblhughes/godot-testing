extends CanvasLayer

signal weight_upgrade
signal impulse_upgrade

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().coin_update.connect(_on_coin_update)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_upgrade_weight_pressed():
	weight_upgrade.emit()
	pass # Replace with function body.


func _on_upgrade_impulse_pressed():
	impulse_upgrade.emit()
	pass # Replace with function body.

func _on_coin_update(value):
	%Coins.text = str(value)


func _on_texture_button_pressed():
	hide()
	pass # Replace with function body.
