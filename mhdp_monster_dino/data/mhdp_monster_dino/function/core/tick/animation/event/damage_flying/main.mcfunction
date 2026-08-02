#> mhdp_monster_dino:core/tick/animation/event/damage_flying/main
#
# アニメーションイベントハンドラ 飛行中怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 移動
    execute if score @s aj.damage_flying.frame matches 6 at @s run function mhdp_monsters:core/util/tick/event/vector_move_offset_start.m {\
        Tick:10,OffsetX:0.0,OffsetY:0.0,OffsetZ:0.0,IsAdjustLand:"true"\
    }
    execute if score @s aj.damage_flying.frame matches 6..15 at @s run function mhdp_monsters:core/util/tick/event/vector_move

# 効果音
    execute if score @s aj.damage_flying.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.hurt master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.damage_flying.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.hurt master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.damage_flying.frame matches 15 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.3 0.1 1.3 0 30
    execute if score @s aj.damage_flying.frame matches 15 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    execute if score @s aj.damage_flying.frame matches 15.. run function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.damage_flying.frame matches 39 run function mhdp_monster_dino:core/tick/animation/event/damage_flying/end
