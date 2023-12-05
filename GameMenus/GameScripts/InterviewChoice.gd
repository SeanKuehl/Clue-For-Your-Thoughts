extends Control


signal Pressed(interviewName)

var myName = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func FillMe(newName):
	myName = newName
	$InterviewName.text = myName


func _on_interview_button_pressed():
	emit_signal("Pressed", myName)
