extends Control

var streamLoaded = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Settings.LoadMusicFirstTime()
	$AudioStreamPlayer2D.stream = load(Settings.GetMainMusic())
	streamLoaded = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if streamLoaded:
		
		$AudioStreamPlayer2D.play()
		streamLoaded = false


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://MainScreenMenus/CaseSelectScreen.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


func _on_gallery_button_pressed():
	get_tree().change_scene_to_file("res://MainScreenMenus/GalleryMenu.tscn")


func _on_audio_stream_player_2d_finished():
	$Timer.start()


func _on_timer_timeout():
	streamLoaded = true
