extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var content = Settings.ReadLinesFromFile(Settings.caseDirectory+"CaseFacts.txt")
	ShowFacts(content)


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
