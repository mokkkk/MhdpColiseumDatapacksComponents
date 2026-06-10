#> mhdp_monster_ranposu:core/tick/animation/event/interrupt_object_tackle/main
#
# アニメーションイベントハンドラ 怯み・建築物攻撃
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 移動
    execute if score @s aj.interrupt_object_tackle.frame matches 2..8 at @s run tp @s ^ ^ ^-0.4
    execute if score @s aj.interrupt_object_tackle.frame matches 9..21 at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.interrupt_object_tackle.frame matches 22..27 at @s run tp @s ^ ^ ^-0.1

# 効果音
    execute if score @s aj.interrupt_object_tackle.frame matches 8 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.interrupt_object_tackle.frame matches 8 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.interrupt_object_tackle.frame matches 15 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.interrupt_object_tackle.frame matches 34 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.interrupt_object_tackle.frame matches 49 run function mhdp_monster_ranposu:core/tick/animation/event/interrupt_object_tackle/end
