#> mhdp_monster_dino:core/tick/animation/event/tail_side_l/attack_head
#
# アニメーションイベントハンドラ 尻尾攻撃・側面
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# データ読み込み
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"TailSide"}]
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# ヒット確認
    # 対プレイヤー
        execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/tail_side_l/m.attack_tail with entity @s data.locators.pos_tail_1
        execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/tail_side_l/m.attack_tail with entity @s data.locators.pos_tail_2
        execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/tail_side_l/m.attack_tail with entity @s data.locators.pos_tail_3
        execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/tail_side_l/m.attack_tail with entity @s data.locators.pos_tail_4
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        tag @a remove Temp.Hit
    # 対モンスター
        execute positioned ^ ^1 ^7 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..2.6] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^9 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..2.6] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^11 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Dino,distance=..2.6] run tag @s add Temp.Hit
        execute if entity @n[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @n[tag=Temp.Victim] as @n[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
