extends Control


var descriptionList = []
var imageList = []

var universalIndex = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists("user://WonCases.txt"):
		var galleryFile = Settings.ReadLinesFromFile("user://WonCases.txt")
		PopulateImageAndDescriptionLists(galleryFile)
	else:
		Settings.CreateSaveFile("user://WonCases.txt")
	
		
		
	
	if len(descriptionList) > 0:
		$GalleryImage.visible = true
		UpdateImageAndLabel()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func UpdateImageAndLabel():
	$GalleryImage.texture = load("res://Assets/GalleryImages/"+imageList[universalIndex])
	$Label.text = descriptionList[universalIndex]
	
func PopulateImageAndDescriptionLists(content):
	
	for line in content:
		if line == "" or line == " ":
			pass
		else:
		
			var splitLine = line.split(",")
			
			
			if (splitLine[3])[0] == "1":
				descriptionList.append(splitLine[2])
				imageList.append(splitLine[1])


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://MainScreenMenus/MainMenu.tscn")


func _on_left_button_pressed():
	var min = 0
	if universalIndex > min and len(descriptionList) > min:
		universalIndex -= 1
		UpdateImageAndLabel()

func _on_right_button_pressed():
	var max = len(descriptionList) -1
	if universalIndex < max and len(descriptionList) > 0:
		universalIndex += 1
		UpdateImageAndLabel()
	







