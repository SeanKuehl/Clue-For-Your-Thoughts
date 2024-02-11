extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var galleryFile = Settings.ReadLinesFromFile("user://WonCases.txt")
	var newContent = UpdateSaveFile(galleryFile)
	WriteSaveFile(newContent)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func WriteSaveFile(listToWrite):
	
	if FileAccess.file_exists("user://WonCases.txt"):
	
		var file = FileAccess.open("user://WonCases.txt", FileAccess.WRITE)
		
		for line in listToWrite:
			file.store_line(line)
			
	else:
		Settings.CreateSaveFile("user://WonCases.txt")
		
		var file = FileAccess.open("user://WonCases.txt", FileAccess.WRITE)
		
		for line in listToWrite:
			file.store_line(line)
	
func UpdateSaveFile(content):
	
	var contentIndex = 0
	var updated = content
	
	for line in content:
		
		if line == "" or line == " ":
			pass
		else:
		
			var splitLine = line.split(",")
			
			
			if Settings.caseName == splitLine[0]:
				
				
				if (splitLine[3])[0] == "0":
					#if the case has not been logged as won/beaten yet
					#[3][0] is for the \r in the last element sometimes
					splitLine[3] = "1"
					updated[contentIndex] = ",".join(splitLine)
					
					
			contentIndex += 1
		
	return updated
			


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://MainScreenMenus/MainMenu.tscn")
