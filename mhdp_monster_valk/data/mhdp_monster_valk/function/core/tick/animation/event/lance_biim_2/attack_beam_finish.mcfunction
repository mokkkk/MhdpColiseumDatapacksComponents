#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_finish
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
    function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_finish_loop
    scoreboard players reset #mhdp_temp_valk_beam_count MhdpCore

# 攻撃
    execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
    tag @a remove Temp.Hit

# 対モンスター
    execute positioned ^ ^1 ^5 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..5.5] run tag @s add Temp.Hit
    execute positioned ^ ^1 ^10 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..5.5] run tag @s add Temp.Hit
    execute positioned ^ ^1 ^15 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..5.5] run tag @s add Temp.Hit
    execute positioned ^ ^1 ^20 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..5.5] run tag @s add Temp.Hit
    execute if entity @n[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
    execute if entity @n[tag=Temp.Victim] as @n[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
