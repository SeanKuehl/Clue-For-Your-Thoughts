extends Control

var imageDir = ""
var imageList = []
var imageIndex = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var content = Settings.ReadLinesFromFile(Settings.caseDirectory+"/Evidence.txt")
	ReadPictures(content)
	imageDir = Settings.caseDirectory+"Images/"
	
	$EvidenceImage.texture = load(imageDir+imageList[imageIndex])


func ReadPictures(content):
	
	for x in content:
		if x == "" or x == " ":
			pass
		else:
			imageList.append(x)
		
func LoadPicture():		
	$EvidenceImage.texture = load(imageDir+imageList[imageIndex])


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://GameMenus/MainGameScreen.tscn")


func _on_left_button_pressed():
	var minIndex = 0
	
	if imageIndex > minIndex:
		imageIndex -= 1
		LoadPicture()


func _on_right_button_pressed():
	var maxIndex = len(imageList) - 1
	
	if imageIndex < maxIndex:
		imageIndex += 1
		LoadPicture()
