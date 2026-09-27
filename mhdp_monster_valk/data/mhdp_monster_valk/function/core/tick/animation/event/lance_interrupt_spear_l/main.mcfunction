#> mhdp_monster_valk:core/tick/animation/event/lance_interrupt_spear_l/main
#
# アニメーションイベントハンドラ 割り込み 2連突き L
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.lance_interrupt_spear_l.frame matches 1..6 at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.lance_interrupt_spear_l.frame matches 7..13 at @s run tp @s ^ ^ ^-0.1

# 効果音
    execute if score @s aj.lance_interrupt_spear_l.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 1 0.4
    execute if score @s aj.lance_interrupt_spear_l.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_interrupt_spear_l.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 0.8 0.4

    execute if score @s aj.lance_interrupt_spear_l.frame matches 6 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s aj.lance_interrupt_spear_l.frame matches 6 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2

    execute if score @s aj.lance_interrupt_spear_l.frame matches 19 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_interrupt_spear_l.frame matches 19 run particle block{block_state:"minecraft:sand"} ^3 ^ ^-2 2 0.1 2 0 30
    execute if score @s aj.lance_interrupt_spear_l.frame matches 58 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_interrupt_spear_l.frame matches 78 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_interrupt_spear_l.frame matches 78 run particle block{block_state:"minecraft:sand"} ^ ^ ^2 2 0.1 2 0 30

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_interrupt_spear_l.frame matches 87 run function mhdp_monster_valk:core/tick/animation/event/lance_interrupt_spear_l/end
