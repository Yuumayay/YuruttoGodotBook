extends Node

var level := 0
var state := 0
enum {TITLE, GAME, END}

var time := 0.0

var scenes := [
	preload("res://level/1.tscn"),
	preload("res://level/2.tscn"),
	preload("res://level/3.tscn"),
	preload("res://level/4.tscn"),
	preload("res://level/5.tscn"),
	preload("res://level/6.tscn"),
	preload("res://level/7.tscn"),
	preload("res://level/8.tscn"),
	preload("res://level/9.tscn"),
	preload("res://level/10.tscn"),
	preload("res://level/11.tscn"),
	preload("res://level/12.tscn"),
	preload("res://level/13.tscn"),
	preload("res://level/14.tscn"),
	preload("res://level/15.tscn"),
	preload("res://title.tscn")
]

func change_scene(to):
	await get_tree().create_timer(0).timeout
	if to < scenes.size():
		get_tree().change_scene_to_packed(scenes[to])
	return

func _process(delta):
	if state == GAME:
		time += delta
