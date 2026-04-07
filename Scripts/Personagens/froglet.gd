extends CharacterBody2D


var estados = ["andar","ataque1","ataque2","gosma"]
var estado_sorteado = "idle"
var hit = false
var flag_boss = false
@onready var animacao = $Animacao
@onready var colisao = $Colisao


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	
	if estado_sorteado == "idle":
		animacao.hide()
		colisao.disabled = true
	elif estado_sorteado == "andar" and hit == false:
		animacao.play("andar")
		colisao.disabled = false
	elif estado_sorteado == "ataque1" and hit == false:
		animacao.play("ataque1")
		colisao.disabled = false
	elif estado_sorteado == "ataque2" and hit == false:
		animacao.play("ataque2")
		colisao.disabled = false
	elif estado_sorteado == "gosma" and hit == false:
		animacao.play("gosma")
		colisao.disabled = false
	elif hit:
		animacao.play("hit")
		colisao.disabled = false
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_boss_visivel_screen_entered() -> void:
	flag_boss = true
	print("personagem entrou na tela")
	FCM()


func _on_boss_visivel_screen_exited() -> void:
	flag_boss = false
	print("personagem saiu da tela")
	FCM()
	
	
func FCM() -> void:
	if flag_boss:
		estado_sorteado = estados.pick_random()
		await get_tree().create_timer(2.0).timeout
	else:
		estado_sorteado = "idle"
