#> mhdp_monster_dino:core/tick/animation/event/jump_tail_r/attack_head
#
# アニメーションイベントハンドラ 尻尾攻撃・飛びかかり
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# データ読み込み
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] run data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"TailJump"}]
    execute if entity @s[tag=Mns.Dino.State.TailHeat] run data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"TailJump.Heat"}]
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# ヒット確認
    # 対プレイヤー
        execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/jump_tail_r/m.attack_tail with entity @s data.locators.pos_tail_1
        execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/jump_tail_r/m.attack_tail with entity @s data.locators.pos_tail_2
        execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/jump_tail_r/m.attack_tail with entity @s data.locators.pos_tail_3
        execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/jump_tail_r/m.attack_tail with entity @s data.locators.pos_tail_4
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        tag @a remove Temp.Hit

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
