extends CharacterBody2D

@export var speed = 50

var screen_size
var posicion
var life
var collision
var points

func _ready():
	screen_size = get_viewport_rect().size
	$AnimationPlayer.play("down_idle")
	pass
	
func start(pos):
	position = pos
	show()
	
func _physics_process(delta): 
	player_movement(delta)
	pass
	
func player_movement(delta): 
	var velocity = Vector2()

	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$AnimationPlayer.play("right_walk")
		posicion = 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$AnimationPlayer.play("left_walk")
		posicion = 2
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		$AnimationPlayer.play("down_walk")
		posicion = 3
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		$AnimationPlayer.play("up_walk")
		posicion = 4
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimationPlayer.play()
	else:
		if(posicion == 1):
			$AnimationPlayer.play("right_idle")
		if(posicion == 2):
			$AnimationPlayer.play("left_idle")
		if(posicion == 3):
			$AnimationPlayer.play("down_idle")
		if(posicion == 4):
			$AnimationPlayer.play("up_idle")
	
	position += velocity * delta
	move_and_slide()
