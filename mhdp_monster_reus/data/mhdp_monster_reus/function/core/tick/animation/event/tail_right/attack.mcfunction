#> mhdp_monster_ranposu:core/tick/animation/event/tail_right/attack
#
# アニメーションイベントハンドラ 尻尾攻撃
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# データ読み込み
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1001}].Attacks[{Name:"Tail"}]
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# ヒット確認
    # 対プレイヤー
        execute positioned ^ ^ ^-3 as @a[tag=Ply.State.EnableDamage,distance=..3.2] run tag @s add Temp.Hit
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        tag @a remove Temp.Hit
    # 対モンスター
        execute positioned ^ ^ ^-3 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Ranposu,distance=..3.2] run tag @s add Temp.Hit
        execute if entity @e[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @e[tag=Temp.Victim] as @e[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 演出
    particle cloud ^ ^2 ^-4 0.1 0.1 0.1 0.1 1

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
