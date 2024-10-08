#> mhdp_monster_ranposu:core/tick/animation/event/state_stun/main
#
# アニメーションイベントハンドラ スタン
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.state_stun.frame matches 4 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# スタン中演出
    execute if entity @s[tag=Mns.State.IsStun] on passengers if entity @s[tag=aj.data] run function mhdp_monster_ranposu:core/tick/animation/event/state_stun/effect_stun with entity @s data.locators.pos_head
    scoreboard players set @s Mns.General.BlinkTimer 3
    
# 終了
    execute if score @s aj.state_stun.frame matches 34 run function mhdp_monster_ranposu:core/tick/animation/event/state_stun/end
