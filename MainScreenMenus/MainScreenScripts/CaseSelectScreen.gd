extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://MainScreenMenus/MainMenu.tscn")


func _on_level_one_pressed():
	
	Settings.caseName = "Cookie Jar Case"
	Settings.caseDirectory = "res://Assets/CookieJarCase/"
	get_tree().change_scene_to_file("res://GameMenus/MainGameScreen.tscn")


func _on_level_two_pressed():
	Settings.caseName = "Love Triangle"
	Settings.caseDirectory = "res://Assets/LoveTriangle/"
	get_tree().change_scene_to_file("res://GameMenus/MainGameScreen.tscn")


func _on_level_three_pressed():
	Settings.caseName = "Shocking Conclusion"
	Settings.caseDirectory = "res://Assets/ShockingConclusion/"
	get_tree().change_scene_to_file("res://GameMenus/MainGameScreen.tscn")


func _on_level_four_pressed():
	Settings.caseName = "Dirty Laundry"
	Settings.caseDirectory = "res://Assets/Dirty Laundry/"
	get_tree().change_scene_to_file("res://GameMenus/MainGameScreen.tscn")


func _on_level_five_pressed():
	Settings.caseName = "Famous Forever"
	Settings.caseDirectory = "res://Assets/FamousForever/"
	get_tree().change_scene_to_file("res://GameMenus/MainGameScreen.tscn")
