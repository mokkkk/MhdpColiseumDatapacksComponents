#> mhdp_monster_dino:core/tick/animation/event/tail_attack_l/attack
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# データ読み込み
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] run data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"Round"}]
    execute if entity @s[tag=Mns.Dino.State.TailHeat] run data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"Round.Heat"}]
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# ヒット確認
    # 対プレイヤー
        execute rotated ~-120 ~ positioned ^ ^ ^6 as @a[tag=Ply.State.EnableDamage,distance=..4.7] run tag @s add Temp.Hit
        execute rotated ~-90 ~ positioned ^ ^ ^6 as @a[tag=Ply.State.EnableDamage,distance=..4.7] run tag @s add Temp.Hit
        execute rotated ~-60 ~ positioned ^ ^ ^6 as @a[tag=Ply.State.EnableDamage,distance=..4.7] run tag @s add Temp.Hit
        execute rotated ~-30 ~ positioned ^ ^ ^6 as @a[tag=Ply.State.EnableDamage,distance=..4.7] run tag @s add Temp.Hit
        execute rotated ~0 ~ positioned ^ ^ ^6 as @a[tag=Ply.State.EnableDamage,distance=..4.7] run tag @s add Temp.Hit
        execute rotated ~30 ~ positioned ^ ^ ^6 as @a[tag=Ply.State.EnableDamage,distance=..4.7] run tag @s add Temp.Hit
        execute rotated ~60 ~ positioned ^ ^ ^6 as @a[tag=Ply.State.EnableDamage,distance=..4.7] run tag @s add Temp.Hit
        execute rotated ~90 ~ positioned ^ ^ ^6 as @a[tag=Ply.State.EnableDamage,distance=..4.7] run tag @s add Temp.Hit
        execute rotated ~120 ~ positioned ^ ^ ^6 as @a[tag=Ply.State.EnableDamage,distance=..4.7] run tag @s add Temp.Hit
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        tag @a remove Temp.Hit
    # 対モンスター
        execute rotated ~-120 ~ positioned ^ ^ ^6 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..4.7] run tag @s add Temp.Hit
        execute rotated ~-90 ~ positioned ^ ^ ^6 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..4.7] run tag @s add Temp.Hit
        execute rotated ~-60 ~ positioned ^ ^ ^6 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..4.7] run tag @s add Temp.Hit
        execute rotated ~-30 ~ positioned ^ ^ ^6 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..4.7] run tag @s add Temp.Hit
        execute rotated ~0 ~ positioned ^ ^ ^6 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..4.7] run tag @s add Temp.Hit
        execute rotated ~30 ~ positioned ^ ^ ^6 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..4.7] run tag @s add Temp.Hit
        execute rotated ~60 ~ positioned ^ ^ ^6 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..4.7] run tag @s add Temp.Hit
        execute rotated ~90 ~ positioned ^ ^ ^6 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..4.7] run tag @s add Temp.Hit
        execute rotated ~120 ~ positioned ^ ^ ^6 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..4.7] run tag @s add Temp.Hit
        execute if entity @n[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @n[tag=Temp.Victim] as @n[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
