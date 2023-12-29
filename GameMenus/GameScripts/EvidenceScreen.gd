extends Control

var imageDir = ""
var imageList = []
var descriptionList = []
var imageIndex = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var content = Settings.ReadLinesFromFile(Settings.caseDirectory+"Evidence.txt")
	
	if EmptyFile(content):
		$EvidenceDescription.text = "No Evidence to display"
		$EvidenceImage.visible = false
	else:
	
		ReadPictures(content)
		imageDir = Settings.caseDirectory+"Images/"
		
		$EvidenceImage.texture = load(imageDir+imageList[imageIndex])
		$EvidenceDescription.text = descriptionList[imageIndex]


func EmptyFile(content):
	
	if content[0] == "" or content[0] == " ":
		return true
	else:
		return false


func ReadPictures(content):
	var bothValues = ""
	
	for x in content:
		if x == "" or x == " ":
			pass
		else:
			bothValues = x.split(",")
			imageList.append(bothValues[0])
			descriptionList.append(bothValues[1])
			
	
		
func LoadPicture():		
	$EvidenceImage.texture = load(imageDir+imageList[imageIndex])
	$EvidenceDescription.text = descriptionList[imageIndex]


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
