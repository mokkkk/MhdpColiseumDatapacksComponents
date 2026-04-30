#> mhdp_monster_karakuri:core/tick/animation/event/bite/attack
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_karakuri:core/tick/animation/event/tick

# データ読み込み
    function mhdp_monsters:core/util/tick/get_attack_data.m {Uid:"8001",Name:"Bite"}

# ヒット確認
    # 対プレイヤー
        execute positioned ^ ^1 ^6.7 as @a[tag=Ply.State.IsTraining,distance=..3.5] run tag @s add Temp.Hit
        execute as @a[tag=Temp.Hit] run function api:damage_entity_to_player
        tag @a remove Temp.Hit
    # 対モンスター
        execute positioned ^ ^1 ^6.7 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Karakuri,distance=..3.5] run tag @s add Temp.Hit
        execute if entity @e[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @e[tag=Temp.Victim] as @e[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
