extends Node3D

# Hard calculated from a = v^2/r
var initial_distance := 20.0
var initial_velocity := 25.0
var initial_acceleration := (initial_velocity)**2 / initial_distance
var current_velocity: Vector3
var current_acceleration: Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector3(0, 0, initial_distance)
	current_velocity = Vector3(initial_velocity, 0, 0)
	print(current_velocity)

func _physics_process(delta: float) -> void:
	var target_position = $"../Star".transform.origin
	var current_position = transform.origin
	var direction = (target_position - current_position).normalized()
	print((target_position - current_position).length())
	
	current_acceleration = direction * initial_acceleration
	current_velocity = current_velocity + current_acceleration * delta
	position = position + current_velocity * delta


#func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	#var target_position = $"../Star".transform.origin
	#var current_position = state.transform.origin
	#var direction = (target_position - current_position).normalized()
	#var distance = (target_position - current_position).length()
	#var magnitude = state.linear_velocity.length_squared() / distance
	#var force = direction * magnitude
	#
	#state.apply_force(force)
