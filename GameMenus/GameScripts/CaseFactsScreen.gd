extends Control

var streamLoaded = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.stream = load(Settings.GetGameMusic())
	streamLoaded = true
	
	var content = Settings.ReadLinesFromFile(Settings.caseDirectory+"CaseFacts.txt")
	
	if EmptyFile(content):
		$FactsLabel.text = "No significant case facts to show"
		
	else:
		ShowFacts(content)


func _process(delta):
	if streamLoaded:
		$AudioStreamPlayer2D.play()
		streamLoaded = false


func EmptyFile(content):
	
	if content[0] == "" or content[0] == " ":
		return true
	else:
		return false


func ShowFacts(content):
	var facts = []
	var thisFact = ""
	var index = 1
	
	for x in content:
		if x != "1":
			thisFact += x+"\n"
			
		if x == "1":
			facts.append(thisFact)
			thisFact = ""
			
	var toDisplay = ""
	
	for x in facts:
		toDisplay += "Fact "+str(index)+": "+x+"\n\n\n\n"
		index += 1
		
	$FactsLabel.text = toDisplay


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://GameMenus/MainGameScreen.tscn")


func _on_audio_stream_player_2d_finished():
	streamLoaded = true
