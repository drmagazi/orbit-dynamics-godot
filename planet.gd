extends RigidBody3D

var initial_velocity = 25
var initial_distance = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	linear_velocity = Vector3(initial_velocity, 0, 0)
	position = Vector3(0, 0, initial_distance)

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	var target_position = $"../Star".transform.origin
	var current_position = state.transform.origin
	var direction = (target_position - current_position).normalized()
	var distance = (target_position - current_position).length()
	var magnitude = state.linear_velocity.length_squared() / distance
	var force = direction * magnitude
	
	state.apply_force(force)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
