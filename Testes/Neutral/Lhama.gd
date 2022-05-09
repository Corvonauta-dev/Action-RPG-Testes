extends KinematicBody2D

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")

enum {
	IDLE,
	WANDER,
	RUN
}

export var ACCELERATION = 300
export var MAX_SPEED = 50
export var FRICTION = 200


var knockback = Vector2.ZERO
var velocity = Vector2.ZERO
var state = IDLE
var test = true

onready var stats = $Stats
onready var batDetectionZone = $BatDetctionZone
onready var animatedSprite = $AnimatedSprite

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	knockback = move_and_slide(knockback)
	
	match state:
		IDLE:
			
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			if test:
				animatedSprite.play("StartEating")
				animatedSprite.play("Eating")
				test = false
			
			seek_bat()
			
			#if wanderController.get_time_left() == 0:
			#	update_wander()
		WANDER:
			seek_bat()
			
			#if wanderController.get_time_left() == 0:
			#	update_wander()
				
			#accelerate_towards_point(wanderController.target_position, delta)
			
			
			#if global_position.distance_to(wanderController.target_position) <= WANDER_TARGUET_RANGE:
			#	update_wander()
			
		RUN:
			var bat = batDetectionZone.bat
			if bat != null:
				accelerate_towards_point(bat.global_position, delta)
			else:
				state = IDLE
				test = true
				
	velocity = move_and_slide(velocity)

func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(- direction * MAX_SPEED, ACCELERATION * delta)
	
	if(velocity.x < 0):
		animatedSprite.play("RunLeft")
	elif velocity.x > 0:
		animatedSprite.play("RunRight")
	
	
	

func seek_bat():
	if batDetectionZone.can_see_bat():
		state = RUN

func _on_HurtBox_area_entered(area):
	stats.health -= area.damage
	
	knockback = area.knockback_vector_l * 150
	print("ai")
	


func _on_Stats_no_health():
	queue_free()
	var enemyDeathEffect = EnemyDeathEffect.instance()
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.global_position = global_position


