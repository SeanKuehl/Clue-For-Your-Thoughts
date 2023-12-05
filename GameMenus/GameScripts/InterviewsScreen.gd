extends Control

const interviewChoiceObject = preload("res://GameMenus/InterviewChoice.tscn")
var interviewList = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var content = Settings.ReadLinesFromFile(Settings.caseDirectory+"/Interviews.txt")
	interviewList = ParseInterviews(content)
	PlaceInterviewObjects(interviewList)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func PlaceInterviewObjects(interviews):
	var xStart = 20
	var yStart = 160
	var yOffset = 200
	var totalPlaced = 0
	
	for inter in interviews:
		var newInter = interviewChoiceObject.instantiate()
		newInter.global_position = Vector2(xStart, yStart+(yOffset*totalPlaced))
		newInter.FillMe(inter[0])	#this is the name of the interview
		newInter.Pressed.connect(ChoicePressed)
		add_child(newInter)
		
		totalPlaced += 1
		
		
func ChoicePressed(passedName):
	var collectedInterview = ""
	
	for inter in interviewList:
		if inter[0] == passedName:
			
			for x in range(0, len(inter)):
				
				if x == 0:
					#it's the name
					collectedInterview += "Interviewee: "+inter[x]+"\n"
					
				elif x % 2 > 0:
					collectedInterview += "Q: "+inter[x]+"\n"
				
				elif x % 2 == 0:
					collectedInterview += "A: "+inter[x]+"\n"
					
	$ScrollContainer/Label.text = collectedInterview
	
	
func ParseInterviews(content):
	var currentInterview = []
	var interviews = []
	var thisLine = ""
	
	for line in content:
		
		if line == "#" and currentInterview == []:
			#ignore
			pass
		elif line == "#" and currentInterview != []:
			interviews.append(currentInterview)
			currentInterview = []
		elif line != "1":
			thisLine += line + "\n"
		elif line == "1":
			currentInterview.append(thisLine)
			thisLine = ""
			
	return interviews
			


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://GameMenus/MainGameScreen.tscn")
