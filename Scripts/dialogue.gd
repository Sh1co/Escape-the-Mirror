extends SLevel

export(Array) var messages

var msgs_index = 0
onready var tween = $Tween
onready var gameplay_music = $"../GamePlayBGMusic"
onready var bg_music = $"../BGMusic"


func _ready():
	_play_background_music()
	show_next_msg()


func _input(event):
	if event.is_action_pressed("ui_accept"):
		$MessageDelay.stop()
		show_next_msg()


func show_next_msg():
	if msgs_index >= messages.size():
		level_complete()
		return
	$Dialogue.modulate.a = 0
	tween.interpolate_property($Dialogue, "modulate:a", 0, 1, 1)
	tween.start()
	$Dialogue.text = messages[msgs_index]
	msgs_index += 1
	$MessageDelay.autostart = true
	$MessageDelay.start()


func _play_background_music():
	if !bg_music.playing:
		bg_music.playing = true
		gameplay_music.playing = false
