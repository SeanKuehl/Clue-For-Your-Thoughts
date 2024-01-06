extends Node


var caseName = ""
var caseDirectory = ""

var menuMusicDirectory = "res://Assets/Music/main/"
var gameMusicDirectory = "res://Assets/Music/"

var gameMusic = []
var mainMusic = []

var rng = RandomNumberGenerator.new()


func ReadLinesFromFile(fileName):
	
	var file = FileAccess.open(fileName, FileAccess.READ)
	
	var content = file.get_as_text()
	
	#check for empty lines! reading etc the file will add an empty line onto the end of it
	

	file.close()
	var noNew = content.split("\n") #get rid of newlines

	return noNew
	
	
	
func LoadMusicFirstTime():
	gameMusic = LoadMusicInDirectory(gameMusicDirectory)
	mainMusic = LoadMusicInDirectory(menuMusicDirectory)
	
	
func GetMainMusic():
	return mainMusic[0]
	
func GetGameMusic():
	var randNum = rng.randi_range(0,len(gameMusic)-1)
	return gameMusic[randNum]
	




func _ready():
	pass












func LoadMusicInDirectory(dir):
	#change this to get the .import files and take off the .import ending
	#because only the .imports are there in the exported version

	var allFiles = GetFilePathsInDirectory(dir)
	#there's both the audio files and the import files in the directory
	#remove every other element, we can't play and don't want to play the import files

	var musicFiles = []
	for x in allFiles:
		#if music file ends in ".import", cut off the ".import" and
		#load it
		#this explains what this mess is: https://godotengine.org/qa/96597/audio-crashes-and-missing-on-exported-project-3-2-3

		if x.ends_with(".import"):

			x = x.substr(0,len(x)-7)

			musicFiles.append(x)
			
			
	return musicFiles



	

#make a way to resume music between menus(play() can take a time parameter)


#dir is the path to a dictory
#this function takes a directory and returns the full paths to files, ["c:/hello.txt"] for example
func GetFilePathsInDirectory(dir):

	var fileNames = dir_contents(dir)
	var filePaths = []
	#to read from the file, it will need the full path to the file
	for x in fileNames:
		filePaths.append(dir+x)

	return filePaths



func dir_contents(path):
	var files = []
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
			elif not file_name.begins_with("."):
				files.append(file_name)
				
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
		
	return files




	
	

	
	
	
	
	
