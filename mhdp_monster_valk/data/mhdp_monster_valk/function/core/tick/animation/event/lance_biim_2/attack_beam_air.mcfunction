#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# データ読み込み
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"Beam"}]
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# 壁に当たるまで再帰
    scoreboard players set #mhdp_temp_valk_beam_count MhdpCore 30
    $execute positioned ^$(posx) ^$(posy) ^$(posz) facing entity @n[type=area_effect_cloud,tag=Mns.BeamPos.Valk] feet run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_air_loop
    scoreboard players reset #mhdp_temp_valk_beam_count MhdpCore

# 攻撃
    execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
    tag @a remove Temp.Hit

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
