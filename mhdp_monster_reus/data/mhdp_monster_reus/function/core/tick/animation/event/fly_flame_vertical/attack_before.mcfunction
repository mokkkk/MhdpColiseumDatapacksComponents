#> mhdp_monster_reus:core/tick/animation/event/fly_flame_vertical/attack
#
# アニメーションイベントハンドラ なぎはらい火炎放射
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# データ読み込み
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1002}].Attacks[{Name:"FlameSweep"}]
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# 演出
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_reus:core/tick/animation/event/fly_flame_vertical/effect/start with entity @s data.locators.pos_head
    playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5

# ヒット確認
    # 対プレイヤー
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        tag @a remove Temp.Hit
    # 対モンスター
        execute if entity @n[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @n[tag=Temp.Victim] as @n[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
