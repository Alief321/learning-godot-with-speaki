extends CanvasLayer
signal start_game
signal pause_game
signal play_game
signal quit_game
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ConfirmationDialog.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$Message.text = "Dodge the Creeps!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)
	

func _on_start_button_pressed() -> void:
	$StartButton.hide()
	start_game.emit()
	

func _on_message_timer_timeout() -> void:
	$Message.hide()


func _on_pause_button_pressed() -> void:
	$PauseButton.hide()
	$PlayButton.show()
	show_message("Game is Paused")
	$OverlayPause.show()
	pause_game.emit()


func _on_play_button_pressed() -> void:
	$PauseButton.show()
	$PlayButton.hide()
	$Message.hide()
	$OverlayPause.hide()
	play_game.emit()


func _on_quit_button_pressed() -> void:
	$OverlayPause.show()
	$ConfirmationDialog.show()
	pause_game.emit()
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		_on_quit_button_pressed()

func _on_confirmation_dialog_confirmed() -> void:
	quit_game.emit()
	pass
	


func _on_confirmation_dialog_canceled() -> void:
	$OverlayPause.hide()
	$ConfirmationDialog.hide()
	play_game.emit()
