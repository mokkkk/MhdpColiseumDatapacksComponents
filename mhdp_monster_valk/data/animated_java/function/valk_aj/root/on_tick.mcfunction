# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[tag=aj.valk_aj.root] run return 0
execute unless score @s aj.is_rig_loaded matches 1 run function #animated_java:global/root/on_load
function #animated_java:valk_aj/as_root/pre_tick
execute if entity @s[tag=aj.valk_aj.animation.pose.playing] run function animated_java:valk_aj/animations/pose/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_pose.playing] run function animated_java:valk_aj/animations/lance_pose/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_search.playing] run function animated_java:valk_aj/animations/lance_search/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_charge_start.playing] run function animated_java:valk_aj/animations/lance_charge_start/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_charge.playing] run function animated_java:valk_aj/animations/lance_charge/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_charge_end.playing] run function animated_java:valk_aj/animations/lance_charge_end/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_charge_damage.playing] run function animated_java:valk_aj/animations/lance_charge_damage/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.state_paralysis.playing] run function animated_java:valk_aj/animations/state_paralysis/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_idle.playing] run function animated_java:valk_aj/animations/lance_idle/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_idle_short.playing] run function animated_java:valk_aj/animations/lance_idle_short/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_head.playing] run function animated_java:valk_aj/animations/lance_damage_head/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_counter_head_start.playing] run function animated_java:valk_aj/animations/lance_damage_counter_head_start/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_counter_wing_r_start.playing] run function animated_java:valk_aj/animations/lance_damage_counter_wing_r_start/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_counter_wing_l_start.playing] run function animated_java:valk_aj/animations/lance_damage_counter_wing_l_start/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_counter.playing] run function animated_java:valk_aj/animations/lance_damage_counter/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_counter_mirror.playing] run function animated_java:valk_aj/animations/lance_damage_counter_mirror/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_counter_end.playing] run function animated_java:valk_aj/animations/lance_damage_counter_end/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_counter_end_mirror.playing] run function animated_java:valk_aj/animations/lance_damage_counter_end_mirror/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_wing_r.playing] run function animated_java:valk_aj/animations/lance_damage_wing_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_wing_l.playing] run function animated_java:valk_aj/animations/lance_damage_wing_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_body_r.playing] run function animated_java:valk_aj/animations/lance_damage_body_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_body_l.playing] run function animated_java:valk_aj/animations/lance_damage_body_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_down_r.playing] run function animated_java:valk_aj/animations/lance_damage_down_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_down_l.playing] run function animated_java:valk_aj/animations/lance_damage_down_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_down_r.playing] run function animated_java:valk_aj/animations/lance_down_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_down_l.playing] run function animated_java:valk_aj/animations/lance_down_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_down_end_r.playing] run function animated_java:valk_aj/animations/lance_down_end_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_down_end_l.playing] run function animated_java:valk_aj/animations/lance_down_end_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_tail.playing] run function animated_java:valk_aj/animations/lance_damage_tail/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_tail_break.playing] run function animated_java:valk_aj/animations/lance_damage_tail_break/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_damage_flying.playing] run function animated_java:valk_aj/animations/lance_damage_flying/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_death.playing] run function animated_java:valk_aj/animations/lance_death/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.death_flying.playing] run function animated_java:valk_aj/animations/death_flying/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_to_shoot.playing] run function animated_java:valk_aj/animations/lance_to_shoot/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_voice.playing] run function animated_java:valk_aj/animations/lance_voice/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_anger.playing] run function animated_java:valk_aj/animations/lance_anger/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_moveback.playing] run function animated_java:valk_aj/animations/lance_moveback/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_turn_r.playing] run function animated_java:valk_aj/animations/lance_turn_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_turn_l.playing] run function animated_java:valk_aj/animations/lance_turn_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_move_start.playing] run function animated_java:valk_aj/animations/lance_move_start/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_move.playing] run function animated_java:valk_aj/animations/lance_move/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_spear_l.playing] run function animated_java:valk_aj/animations/lance_spear_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_spear_r.playing] run function animated_java:valk_aj/animations/lance_spear_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_spear_l_to_r.playing] run function animated_java:valk_aj/animations/lance_spear_l_to_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_spear_r_to_l.playing] run function animated_java:valk_aj/animations/lance_spear_r_to_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_spear_to_spin_l.playing] run function animated_java:valk_aj/animations/lance_spear_to_spin_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_spear_to_spin_r.playing] run function animated_java:valk_aj/animations/lance_spear_to_spin_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_upper_r.playing] run function animated_java:valk_aj/animations/lance_upper_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_upper_l.playing] run function animated_java:valk_aj/animations/lance_upper_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_vertical_r.playing] run function animated_java:valk_aj/animations/lance_vertical_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_vertical_l.playing] run function animated_java:valk_aj/animations/lance_vertical_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_vertical_r_to_l.playing] run function animated_java:valk_aj/animations/lance_vertical_r_to_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_vertical_l_to_r.playing] run function animated_java:valk_aj/animations/lance_vertical_l_to_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_vertical_turn_r.playing] run function animated_java:valk_aj/animations/lance_vertical_turn_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_vertical_turn_l.playing] run function animated_java:valk_aj/animations/lance_vertical_turn_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_bite.playing] run function animated_java:valk_aj/animations/lance_bite/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_dashattack.playing] run function animated_java:valk_aj/animations/lance_dashattack/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_tackle.playing] run function animated_java:valk_aj/animations/lance_tackle/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_flytackle_start.playing] run function animated_java:valk_aj/animations/lance_flytackle_start/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_flytackle.playing] run function animated_java:valk_aj/animations/lance_flytackle/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_flytackle_end.playing] run function animated_java:valk_aj/animations/lance_flytackle_end/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_flytackle_repeat.playing] run function animated_java:valk_aj/animations/lance_flytackle_repeat/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_pose.playing] run function animated_java:valk_aj/animations/shoot_pose/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_idle.playing] run function animated_java:valk_aj/animations/shoot_idle/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_step.playing] run function animated_java:valk_aj/animations/shoot_step/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_turn_r.playing] run function animated_java:valk_aj/animations/shoot_turn_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_turn_l.playing] run function animated_java:valk_aj/animations/shoot_turn_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_to_lance.playing] run function animated_java:valk_aj/animations/shoot_to_lance/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_moveback.playing] run function animated_java:valk_aj/animations/shoot_moveback/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_move_start.playing] run function animated_java:valk_aj/animations/shoot_move_start/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_move.playing] run function animated_java:valk_aj/animations/shoot_move/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_vertical_r.playing] run function animated_java:valk_aj/animations/shoot_vertical_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_vertical_l.playing] run function animated_java:valk_aj/animations/shoot_vertical_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_sweep_r.playing] run function animated_java:valk_aj/animations/shoot_sweep_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_sweep_l.playing] run function animated_java:valk_aj/animations/shoot_sweep_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_sweep_anger_r.playing] run function animated_java:valk_aj/animations/shoot_sweep_anger_r/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_sweep_anger_l.playing] run function animated_java:valk_aj/animations/shoot_sweep_anger_l/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_shot_forward.playing] run function animated_java:valk_aj/animations/shoot_shot_forward/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_shot_horizon.playing] run function animated_java:valk_aj/animations/shoot_shot_horizon/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_bomb_forward.playing] run function animated_java:valk_aj/animations/shoot_bomb_forward/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_bomb_side.playing] run function animated_java:valk_aj/animations/shoot_bomb_side/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_sault_before.playing] run function animated_java:valk_aj/animations/shoot_sault_before/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.shoot_sault.playing] run function animated_java:valk_aj/animations/shoot_sault/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.comet_phase_1.playing] run function animated_java:valk_aj/animations/comet_phase_1/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.comet_phase_2.playing] run function animated_java:valk_aj/animations/comet_phase_2/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.comet_phase_3.playing] run function animated_java:valk_aj/animations/comet_phase_3/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.comet_phase_4.playing] run function animated_java:valk_aj/animations/comet_phase_4/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.comet_phase_5.playing] run function animated_java:valk_aj/animations/comet_phase_5/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_biim_1.playing] run function animated_java:valk_aj/animations/lance_biim_1/zzz/on_tick
execute if entity @s[tag=aj.valk_aj.animation.lance_biim_2.playing] run function animated_java:valk_aj/animations/lance_biim_2/zzz/on_tick
execute on passengers if entity @s[tag=aj.valk_aj.data] run function animated_java:valk_aj/root/zzz/1
execute at @s on passengers run tp @s ~ ~ ~ ~ ~
function #animated_java:valk_aj/as_root/post_tick