#> mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/attack_spin
#
# アニメーションイベントハンドラ 翼槍回転斬り
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# データ読み込み
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"SpearSpin"}]
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# ヒット確認
    # 対プレイヤー
        execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/m.attack_spin with entity @s data.locators.pos_wing_r_1
        execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/m.attack_spin with entity @s data.locators.pos_wing_r_2
        execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/m.attack_spin with entity @s data.locators.pos_wing_r_3
        execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/m.attack_spin with entity @s data.locators.pos_wing_r_4
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        execute if entity @a[tag=Mns.Target.Dino,tag=Temp.Hit] run tag @s add Mns.Temp.IsHit
        tag @a remove Temp.Hit
    # 対モンスター
        execute positioned ^ ^1 ^4 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..2.6] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^7 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..2.6] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^10 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..2.6] run tag @s add Temp.Hit
        execute positioned ^ ^1 ^13 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..2.6] run tag @s add Temp.Hit
        execute if entity @n[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @n[tag=Temp.Victim] as @n[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
