#> mhdp_core:player/damage/entity_to_entity/show_damage
#
# プレイヤーからモンスターに対してのダメージ処理 演出
#
# @within function mhdp_core:player/damage/player_to_entity/main

# 効果音
    playsound minecraft:entity.generic.hurt master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# ダメージ表示
    data modify storage mhdp_core:temp Arg.Color set value "#FF6F00"
    data modify storage mhdp_core:temp Arg.Scale set value 1.0
    execute store result storage mhdp_core:temp Arg.Damage int 1 run scoreboard players get #mhdp_temp_damage_total MhdpCore
    execute store result storage mhdp_core:temp Arg.RotX int 1 run random roll 0..90
    execute store result storage mhdp_core:temp Arg.RotY int 1 run random roll 0..359
    execute store result storage mhdp_core:temp Arg.Dist int 1 run random roll 0..9
    function mhdp_core:player/damage/player_to_entity/macro/m.summon_damage_text with storage mhdp_core:temp Arg
