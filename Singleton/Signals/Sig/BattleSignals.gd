extends "res://Singleton/Signals/BaseSignals.gd"

signal start_round

signal request_turn_order

signal action_finished

signal emit_battle_action(battle_action)

signal resolve_skill(battle_action,function)

signal push_action_stack(action)

signal end_battle
