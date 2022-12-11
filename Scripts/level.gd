class_name Level
extends SGamePlayLevel

var bodies_outside = 0

onready var gameplay_music = $"../GamePlayBGMusic"
onready var bg_music = $"../BGMusic"
onready var win_sfx = $"../WinSfx"
onready var lose_sfx = $"../LoseSfx"


func _ready():
	$Follower.connect("lost", self, "_level_lost")
	$Mirror.connect("lost", self, "_level_lost")
	_play_gameplay_music()


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().reload_current_scene()
	if event.is_action_pressed("reload"):
		_level_lost()

func _on_VisibilityNotifier2D_screen_exited():
	if !$BSDelay.is_stopped() || !$LoseDelay.is_stopped():
		return
	bodies_outside += 1
	if bodies_outside == 2:
		$WinDelay.autostart = true
		$WinDelay.start()
		win_sfx.playing = true


func _on_VisibilityNotifier2D_screen_entered():
	if !$BSDelay.is_stopped() || !$LoseDelay.is_stopped():
		return
	bodies_outside -= 1


func _level_lost():
	lose_sfx.playing = true
	$LoseDelay.autostart = true
	$LoseDelay.start()
	$Follower.queue_free()
	$Mirror.queue_free()
	
func _play_gameplay_music():
	if ! gameplay_music.playing:
		bg_music.playing = false
		gameplay_music.playing = true


func _on_WinDelay_timeout():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	level_complete()


func _on_LoseDelay_timeout():
	$BSDelay.start()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	level_failed()
