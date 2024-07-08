#> mhdp_core:player/damage/player_to_entity/direct_attack_end
#
# プレイヤーがモンスターを直接攻撃した際の処理
#
# @within function mhdp_core:player/damage/player_to_entity/direct_attack

# 終了
    tag @e[type=#lib:living,type=!player,tag=AttackedEntity] remove Temp.Victim
    tag @e[type=#lib:living,type=!player,tag=AttackedEntity] remove AttackedEntity
    tag @s remove this
    scoreboard players reset #mhdp_temp_hitbox_hp MhdpCore
    scoreboard players reset #mhdp_temp_direct_attack_damage MhdpCore
    scoreboard players reset #mhdp_temp_da_damage_multiply MhdpCore
