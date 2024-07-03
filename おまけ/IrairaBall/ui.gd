extends CanvasLayer

@onready var time = $time
@onready var lvl = $lvl

func _process(delta):
	time.text = "%02d:%02d.%03d" % [floor(Game.time / 60.0), int(Game.time) % 60, floor((Game.time - int(Game.time)) * 1000)]
	lvl.text = str(Game.level)
	if Game.state == Game.END:
		time.add_theme_color_override("font_color", "yellow")
		time.add_theme_color_override("font_outline_color", "black")
		lvl.hide()
	elif Game.state == Game.GAME:
		time.add_theme_color_override("font_color", "black")
		time.add_theme_color_override("font_outline_color", "white")
		lvl.show()
	else:
		time.add_theme_color_override("font_color", "black")
		time.add_theme_color_override("font_outline_color", "white")
		lvl.hide()
