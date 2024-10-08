#> mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_sub
#
# アニメーションイベントハンドラ 翼槍叩きつけ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ヒット確認
    # 対プレイヤー
        execute as @a[tag=Ply.State.EnableDamage,distance=..3.4] run tag @s add Temp.Hit
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        tag @a remove Temp.Hit
    # 対モンスター
        execute as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..3.4] run tag @s add Temp.Hit
        execute if entity @n[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @n[tag=Temp.Victim] as @n[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 演出
    particle explosion_emitter ^ ^0.3 ^ 0.3 0.3 0.3 0 1
    particle gust_emitter_large ^ ^ ^ 0.3 0.3 0.3 0 3
    particle dust{color:[1.000,0.000,0.152],scale:4} ^ ^0.3 ^ 1 1 1 0.15 5
