#> mhdp_monster_ranposu:core/tick/animation/event/damage/main
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 移動
    execute if score @s aj.damage.frame matches 1..8 at @s run tp @s ^ ^ ^-0.6
    execute if score @s aj.damage.frame matches 9..16 at @s run tp @s ^ ^ ^-0.1

# 効果音
    execute if score @s aj.damage.frame matches 1..8 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 5
    execute if score @s aj.damage.frame matches 16 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.damage.frame matches 37 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.damage.frame matches 38 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.damage.frame matches 38 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# まばたき
    execute if score @s aj.damage.frame matches 2 run scoreboard players set @s Mns.General.BlinkTimer 20

# 終了
    execute if score @s aj.damage.frame matches 64 run function mhdp_monster_ranposu:core/tick/animation/event/damage/end
