extends Node

func _ready():
	if Game.state == Game.END:
		$Label.show()
		$Button.disabled = true
		await get_tree().create_timer(0.5).timeout
		$Button.disabled = false

func _on_button_pressed():
	Game.time = 0
	Game.level = 0
	Game.state = Game.GAME
	Game.change_scene(Game.level)
