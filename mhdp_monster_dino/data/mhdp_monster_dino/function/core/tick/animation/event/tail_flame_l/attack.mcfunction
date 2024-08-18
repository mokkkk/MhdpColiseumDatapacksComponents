#> mhdp_monster_dino:core/tick/animation/event/tail_flame_l/attack
#
# アニメーションイベントハンドラ 火炎
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# データ読み込み
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"TailFlame.Flame"}]
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# ヒット確認
    # 対プレイヤー
        execute positioned ^ ^1 ^1 as @a[tag=Ply.State.EnableDamage,distance=..3.2] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^3 as @a[tag=Ply.State.EnableDamage,distance=..3.2] run tag @s add Temp.Hit
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        tag @a remove Temp.Hit
    # 対モンスター
        execute positioned ^ ^1 ^1 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..3.2] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^3 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..3.2] run tag @s add Temp.Hit
        execute if entity @n[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @n[tag=Temp.Victim] as @n[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 演出
    execute positioned ^ ^1 ^1 run particle flame ^ ^0.1 ^1.5 0.2 0.1 0.2 0.5 5
    execute positioned ^ ^1 ^3 run particle flame ^ ^0.1 ^1.5 0.2 0.1 0.2 0.5 5
    execute positioned ^ ^1 ^5 run particle flame ^ ^0.1 ^1.5 0.2 0.1 0.2 0.5 5
    execute positioned ^ ^1 ^7 run particle flame ^ ^0.1 ^1.5 0.2 0.1 0.2 0.5 5
    execute positioned ^ ^1 ^1 run particle lava ~ ~0 ~ 0.5 0.5 0.5 0.2 10
    execute positioned ^ ^1 ^3 run particle lava ~ ~0 ~ 0.5 0.5 0.5 0.2 10
    execute positioned ^ ^1 ^5 run particle lava ~ ~0 ~ 0.5 0.5 0.5 0.2 10
    execute positioned ^ ^1 ^7 run particle lava ~ ~0 ~ 0.5 0.5 0.5 0.2 10
    playsound entity.blaze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    playsound entity.blaze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# 弾発射
    function mhdp_monster_dino:core/tick/animation/event/tail_flame_l/shot

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
