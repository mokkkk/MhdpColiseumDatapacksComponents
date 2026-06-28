#> mhdp_monster_ranposu:core/tick/animation/event/damage_down/main
#
# アニメーションイベントハンドラ 大怯み
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 移動
    execute if score @s aj.damage_down.frame matches 2 at @s run function mhdp_monsters:core/util/tick/event/vector_move_offset_start.m {\
        Tick:16,OffsetX:0.0,OffsetY:0.0,OffsetZ:-8.0,IsAdjustLand:"true"\
    }
    execute if score @s aj.damage_down.frame matches 2..17 at @s run function mhdp_monsters:core/util/tick/event/vector_move

# 効果音
    execute if score @s aj.damage_down.frame matches 2 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.damage_down.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.damage_down.frame matches 16 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.damage_down.frame matches 16 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 状態
    execute if score @s aj.damage_down.frame matches 2 run tag @s add Mns.State.IsFlying
    execute if score @s aj.damage_down.frame matches 16 run tag @s remove Mns.State.IsFlying

# まばたき
    execute if score @s aj.damage_down.frame matches 2 run scoreboard players set @s Mns.General.BlinkTimer 20
    
# 終了
    execute if score @s aj.damage_down.frame matches 29 run function mhdp_monster_ranposu:core/tick/animation/event/damage_down/end
