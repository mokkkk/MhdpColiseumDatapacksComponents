#> mhdp_monster_reus:core/tick/animation/event/land_bite_l/attack
#
# アニメーションイベントハンドラ 床ドン
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# データ読み込み
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks[{Name:"Jump"}]
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# ヒット確認
    # 対プレイヤー
        execute positioned ^ ^1 ^ as @a[tag=Ply.State.EnableDamage,distance=..6] run tag @s add Temp.Hit
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        tag @a remove Temp.Hit
    # 対モンスター
        execute positioned ^ ^1 ^ as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Reus,distance=..6] run tag @s add Temp.Hit
        execute if entity @n[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @n[tag=Temp.Victim] as @n[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 演出
    playsound entity.wither.break_block master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    particle explosion ~ ~1 ~ 2 0.5 2 0 15
    particle block{block_state:"minecraft:sand"} ~ ~0.5 ~ 2 0.5 2 0 30

# 風圧怯み
    data modify storage mhdp_core:temp Damage set value {WindValue:2,GuardValue:1}
    execute as @a[tag=Ply.State.EnableDamage,distance=..12] facing entity @s feet positioned as @s run function mhdp_core:player/damage/wind/main
    data remove storage mhdp_core:temp Damage

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
