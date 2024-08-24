#> mhdp_monster_dino:core/tick/animation/event/tail_attack_r_to_step_r/attack_head
#
# アニメーションイベントハンドラ 尻尾叩きつけ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# ヒット確認
    # 対プレイヤー
        execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r_to_step_r/m.attack_tail with entity @s data.locators.pos_tail_1
        execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r_to_step_r/m.attack_tail with entity @s data.locators.pos_tail_2
        execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r_to_step_r/m.attack_tail with entity @s data.locators.pos_tail_3
        execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r_to_step_r/m.attack_tail with entity @s data.locators.pos_tail_4

# データ読み込み
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] run data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"Tail"}]
    execute if entity @s[tag=Mns.Dino.State.TailHeat] run data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"Tail.Heat"}]
    execute if entity @s[tag=!Mns.State.IsAnger] if entity @a[tag=Temp.Hit] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] if entity @a[tag=Temp.Hit] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# ダメージ適用
    execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
    tag @a remove Temp.Hit

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
