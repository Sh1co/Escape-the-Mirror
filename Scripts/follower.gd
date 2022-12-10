class_name Follower
extends Area2D

signal disconnected
signal connected

var og_pos = Vector2.ZERO
var following = false
var mouseDelta : Vector2 = Vector2()


func _ready():
	og_pos = position


func _input(event):
	if event is InputEventMouseMotion:
		mouseDelta = event.relative


func _process(_delta):
	if following:
		_follow()


func reset():
	following = false
	position = og_pos
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	emit_signal("disconnected")


func _follow():
	position += mouseDelta
	mouseDelta=Vector2.ZERO


func _on_Follower_body_entered(body):
	if body.is_in_group("Obstacle"):
		reset()


func _on_Follower_mouse_entered():
	following = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	emit_signal("connected")
