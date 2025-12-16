extends Area2D
signal hit

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	#hide()
	pass # Replace with function body.


func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	
	var moving_horizontal = false
	var moving_vertical = false
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		moving_horizontal = true
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		moving_horizontal=true
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		moving_vertical=true
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		moving_vertical=true

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
		# ===== SOUND CONTROL =====
	if moving_horizontal:
		$FlySound.stop()
		if not $WalkSound.playing:
			$WalkSound.play()
	elif moving_vertical:
		$WalkSound.stop()
		if not $FlySound.playing:
			$FlySound.play()
	else:
		$WalkSound.stop()
		$FlySound.stop()
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "happy"
		$AnimatedSprite2D.flip_v = false
		# See the note below about the following boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x > 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "cry"
		
		
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false

func _on_body_entered(_body):
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
