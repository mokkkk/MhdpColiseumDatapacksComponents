#> mhdp_monster_dino:core/tick/animation/event/death_flying/main
#
# アニメーションイベントハンドラ 飛行中討伐
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 移動
    execute if score @s aj.death_flying.frame matches 6 at @s run function mhdp_monsters:core/util/tick/event/vector_move_offset_start.m {\
        Tick:10,OffsetX:0.0,OffsetY:0.0,OffsetZ:0.0,IsAdjustLand:"true"\
    }
    execute if score @s aj.death_flying.frame matches 6..15 at @s run function mhdp_monsters:core/util/tick/event/vector_move
    
# 効果音
    execute if score @s aj.death_flying.frame matches 15 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.3 0.1 1.3 0 30
    execute if score @s aj.death_flying.frame matches 15 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.death_flying.frame matches 36..50 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.hurt master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.death_flying.frame matches 36..50 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.hurt master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.death_flying.frame matches 66 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# まばたき
    execute if score @s aj.death_flying.frame matches 66 run scoreboard players set @s Mns.General.BlinkTimer 10000000
    
# 接地
    execute if score @s aj.death_flying.frame matches 15.. run function mhdp_monsters:core/util/tick/move/check_landing

# 剝ぎ取り可能にする
    execute if score @s aj.death_flying.frame matches 65 run tag @s add Mns.State.IsCanCarving
    execute if score @s aj.death_flying.frame matches 65 run scoreboard players set @s Mns.General.Carving.Count 3

# 終了
    execute if score @s aj.death_flying.frame matches 66 run function mhdp_monster_dino:core/tick/animation/event/death_flying/end
