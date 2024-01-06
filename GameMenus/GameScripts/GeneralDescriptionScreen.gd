extends Control

var streamLoaded = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.stream = load(Settings.GetGameMusic())
	streamLoaded = true
	
	$CaseTitle.text = Settings.caseName
	
	var content = Settings.ReadLinesFromFile(Settings.caseDirectory+"General.txt")
	
	$CaseDescription.text = DisplayGeneral(content)
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if streamLoaded:
		$AudioStreamPlayer2D.play()
		streamLoaded = false
	
func DisplayGeneral(content):
	
	var result = ""
	
	for x in content:
		result += x+" "
		
	return result


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://GameMenus/MainGameScreen.tscn")



func _on_audio_stream_player_2d_finished():
	streamLoaded = true
