extends Control

const interviewChoiceObject = preload("res://GameMenus/AccuseChoice.tscn")

var accusationList = []

var streamLoaded = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.stream = load(Settings.GetGameMusic())
	streamLoaded = true
	
	var content = Settings.ReadLinesFromFile(Settings.caseDirectory+"Accuse.txt")
	accusationList = GatherAccuses(content)
	PlaceAccuseObjects(accusationList)


func _process(delta):
	if streamLoaded:
		$AudioStreamPlayer2D.play()
		streamLoaded = false

func GatherAccuses(content):
	var accuseList = []
	var thisAccuse = ""
	
	for x in content:
		if x == "" or x == " ":
			pass
		else:
			thisAccuse = x.split(",")
			accuseList.append(thisAccuse)
		
	return accuseList
	
func PlaceAccuseObjects(accuses):
	var xStart = 20
	var yStart = 160
	var yOffset = 200
	var totalPlaced = 0
	
	for accuse in accuses:
		if len(accuse) < 2:
			pass
		else:
			var newInter = interviewChoiceObject.instantiate()
			newInter.global_position = Vector2(xStart, yStart+(yOffset*totalPlaced))
			
			newInter.FillMe(accuse[0], accuse[1])	#this is the name of the interview
			newInter.Pressed.connect(AccusePressed)
			add_child(newInter)
			
			totalPlaced += 1
		
func AccusePressed(rightOrWrong):
	if int(rightOrWrong) == 1:
		get_tree().change_scene_to_file("res://WinAndLossScreens/WinScreen.tscn")
	elif int(rightOrWrong) == 0:
		get_tree().change_scene_to_file("res://WinAndLossScreens/LossScreen.tscn")


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://GameMenus/MainGameScreen.tscn")


func _on_audio_stream_player_2d_finished():
	streamLoaded = true
