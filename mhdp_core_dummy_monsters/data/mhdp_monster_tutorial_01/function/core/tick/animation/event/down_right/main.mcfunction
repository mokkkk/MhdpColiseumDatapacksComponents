#> mhdp_monster_dino:core/tick/animation/event/down_right/main
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick


# 効果音
    execute if score @s aj.down_right.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.down_right.frame matches 2 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 5
    execute if score @s aj.down_right.frame matches 10 run playsound entity.hoglin.attack master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# スタン中演出
    execute if entity @s[tag=Mns.State.IsStun] on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/down_right/effect_stun with entity @s data.locators.pos_head

# 終了
    execute if score @s aj.down_right.frame matches 34 run function mhdp_monster_dino:core/tick/animation/event/down_right/end
