extends KinematicBody2D

var speed : int = 100
var jumpForce : int =400
var gravity : int =500

var vel: Vector2 = Vector2()

onready var sprite : Sprite = get_node("Sprite")

func _physics_process(delta):
	
	vel.x=0
	#movement inputs
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed
		
	#applying the velocity
	vel=move_and_slide(vel, Vector2.UP)
	
	#gravity
	vel.y += gravity * delta
	
	#jump input
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
		
	#sprite direction
	if vel.x <0:
		sprite.flip_h = true
	elif vel.x >0:
		sprite.flip_h = false


