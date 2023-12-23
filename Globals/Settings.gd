extends Node


var caseName = ""
var caseDirectory = ""


func ReadLinesFromFile(fileName):
	
	var file = FileAccess.open(fileName, FileAccess.READ)
	
	var content = file.get_as_text()
	
	#check for empty lines! reading etc the file will add an empty line onto the end of it
	

	file.close()
	var noNew = content.split("\n") #get rid of newlines

	return noNew
	
	

	
	
	
	
	
