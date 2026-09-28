#> mhdp_monster_valk:core/tick/animation/event/lance_interrupt_flytackle/main
#
# アニメーションイベントハンドラ 割り込み 滑空突進
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.lance_interrupt_flytackle.frame matches 2..11 at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.lance_interrupt_flytackle.frame matches 12..18 at @s run tp @s ^ ^ ^-0.05
    execute if score @s aj.lance_interrupt_flytackle.frame matches 15..28 at @s run tp @s ^-0.2 ^ ^ ~6 ~
    execute if score @s aj.lance_interrupt_flytackle.frame matches 20..28 at @s run tp @s ^ ^ ^-0.3

# 効果音
    execute if score @s aj.lance_interrupt_flytackle.frame matches 2..4 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 1 0.4
    execute if score @s aj.lance_interrupt_flytackle.frame matches 2..4 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_interrupt_flytackle.frame matches 2..4 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.lance_interrupt_flytackle.frame matches 28 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_interrupt_flytackle.frame matches 28 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_interrupt_flytackle.frame matches 38 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_interrupt_flytackle.frame matches 38 run function mhdp_monster_valk:core/tick/animation/event/lance_interrupt_flytackle/end
