#> mhdp_monster_valk:core/tick/animation/event/lance_damage_flying/main
#
# アニメーションイベントハンドラ 飛行中怯み
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.lance_damage_flying.frame matches 11 at @s run function mhdp_monsters:core/util/tick/event/vector_move_offset_start.m {\
        Tick:6,OffsetX:0.0,OffsetY:0.0,OffsetZ:0.0,IsAdjustLand:"true"\
    }
    execute if score @s aj.lance_damage_flying.frame matches 11..16 at @s run function mhdp_monsters:core/util/tick/event/vector_move

# 効果音
    execute if score @s aj.lance_damage_flying.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 1 0.4
    execute if score @s aj.lance_damage_flying.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_damage_flying.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 0.8 0.4

    execute if score @s aj.lance_damage_flying.frame matches 16 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_damage_flying.frame matches 16 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 状態
    execute if score @s aj.lance_damage_flying.frame matches 16 run tag @s remove Mns.State.IsFlying
    execute if score @s aj.lance_damage_flying.frame matches 1 run tag @s remove Mns.Valk.State.IsShoot

# 終了
    execute if score @s aj.lance_damage_flying.frame matches 34 run function mhdp_monster_valk:core/tick/animation/event/lance_damage_flying/end
