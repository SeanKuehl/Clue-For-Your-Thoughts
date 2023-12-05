extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_general_description_pressed():
	get_tree().change_scene_to_file("res://GameMenus/GeneralDescriptionScreen.tscn")


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://MainScreenMenus/CaseSelectScreen.tscn")


func _on_interviews_pressed():
	get_tree().change_scene_to_file("res://GameMenus/InterviewsScreen.tscn")


func _on_chat_logs_pressed():
	get_tree().change_scene_to_file("res://GameMenus/ChatLogScreen.tscn")


func _on_case_facts_pressed():
	get_tree().change_scene_to_file("res://GameMenus/CaseFactsScreen.tscn")


func _on_evidence_pressed():
	get_tree().change_scene_to_file("res://GameMenus/EvidenceScreen.tscn")


func _on_accuse_pressed():
	get_tree().change_scene_to_file("res://GameMenus/AccuseScreen.tscn")
