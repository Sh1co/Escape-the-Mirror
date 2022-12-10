extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var tween = $Tween

func _ready():
	flashing_effect()
#	tween.interpolate_property($Control, "modulate",
#		Color(1, 1, 1, 0), Color(1, 1, 1, 1), 2.0,
#		Tween.TRANS_CIRC, Tween.EASE_IN_OUT)
#	tween.start()


func flashing_effect():
	tween.interpolate_property(self, "modulate:a", 0, 1, 2)
	tween.start()
	yield(tween, "tween_completed")
	while true :
		tween.interpolate_property(self, "modulate:a", 1, 0.3, 1)
		tween.start()
		yield(tween, "tween_completed")
		tween.interpolate_property(self, "modulate:a", 0.3, 1, 1)
		tween.start()
		yield(tween, "tween_completed")
