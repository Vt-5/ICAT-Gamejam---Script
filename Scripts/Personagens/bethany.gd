extends CharacterBody2D

#@onready var projetil = preload() ##caminho da cena do projetil aq
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var colisao = $Colisoes
var animation_locked: bool = false
var ataque: bool = false
var pode_ataq: bool = true

const SPEED = 200.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("mov_cima") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("mov_esquerda", "mov_direita")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
# essa parte só é usada pra ataques com projetil, não tenho certeza de o quão bem funcionaria
	#if Input.is_action_just_pressed("ataq") and ataque == false:
		#ataque = true
		
		#var k = projetil.instantiate()
		#k.global_position = PosiçãoDisparo.global_position
		#k.vel = PosiçãoDisparo.scale.x
		#get_parent().add_child(k)
		
		# essa parte pode ser usada pra criar um ataque corpo a corpo, só é necessaria a animação e a hitbox
		#sprite.play("AnimaçãoDeAtaqueAqui")
		#await sprite.animation_finished
		#ataque = false
	
	move_and_slide()
	
	#Animações
	#Run
	if velocity.x !=0 and ataque == false:
		sprite.play("Run")
	elif ataque == false:
		sprite.play("Idle")
	
	#Handle animation flip
	if direction <0:
		#sprite.flip_h = true
		sprite.scale.x = direction
	elif direction >0:
		#sprite.flip_h = false
		sprite.scale.x = direction
