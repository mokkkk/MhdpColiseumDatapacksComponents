#> mhdp_monster_dino:core/tick/animation/event/tail_interrupt_r/main
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 演出
    execute if score @s aj.tail_interrupt_r.frame matches 1..4 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.hurt master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.tail_interrupt_r.frame matches 1..4 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.hurt master @s ^ ^1 ^1 0.4 0.65 0.4

# 移動
    execute if score @s aj.tail_interrupt_r.frame matches 2..8 at @s run tp @s ^ ^ ^-0.2 ~ ~
    execute if score @s aj.tail_interrupt_r.frame matches 9..18 at @s run tp @s ^ ^ ^-0.1 ~ ~

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.tail_interrupt_r.frame matches 47 run function mhdp_monster_dino:core/tick/animation/event/tail_interrupt_r/end
