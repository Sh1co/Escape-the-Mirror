extends SLevel

onready var tween = $Tween
onready var gameplay_music = $"../GamePlayBGMusic"
onready var bg_music = $"../BGMusic"
onready var finish_sfx = $"../FinishSfx"


func _ready():
	gameplay_music.playing = false
	finish_sfx.playing = true
	tween.interpolate_property($WinMessege, "modulate:a", 0, 1, 5)
	tween.start()


func _on_SceneTime_timeout():
	bg_music.playing = true
	level_complete()
