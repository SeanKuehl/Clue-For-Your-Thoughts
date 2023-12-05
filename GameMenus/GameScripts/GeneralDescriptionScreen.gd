extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$CaseTitle.text = Settings.caseName
	
	var content = Settings.ReadLinesFromFile(Settings.caseDirectory+"/General.txt")
	
	$CaseDescription.text = DisplayGeneral(content)
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func DisplayGeneral(content):
	
	var result = ""
	
	for x in content:
		result += x+"\n"
		
	return result


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://GameMenus/MainGameScreen.tscn")

