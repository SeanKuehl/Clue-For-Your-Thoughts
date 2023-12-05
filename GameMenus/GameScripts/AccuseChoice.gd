extends Control

signal Pressed(rightOrWrong)

var myName = ""
var rightOrWrong = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func FillMe(newName, answer):
	myName = newName
	rightOrWrong = answer
	$AccusedName.text = myName



	


func _on_accuse_button_pressed():
	emit_signal("Pressed", rightOrWrong)
