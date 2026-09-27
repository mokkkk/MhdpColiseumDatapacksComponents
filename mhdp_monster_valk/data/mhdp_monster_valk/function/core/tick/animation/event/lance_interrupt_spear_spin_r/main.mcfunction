#> mhdp_monster_valk:core/tick/animation/event/lance_interrupt_spear_spin_r/main
#
# アニメーションイベントハンドラ 割り込み 翼槍回転斬り R
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.lance_interrupt_spear_spin_r.frame matches 2 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s aj.lance_interrupt_spear_spin_r.frame matches 2 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2

    execute if score @s aj.lance_interrupt_spear_spin_r.frame matches 25 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s aj.lance_interrupt_spear_spin_r.frame matches 25 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2

    execute if score @s aj.lance_interrupt_spear_spin_r.frame matches 38 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_interrupt_spear_spin_r.frame matches 38 run particle block{block_state:"minecraft:sand"} ^-3 ^ ^-2 2 0.1 2 0 30
    execute if score @s aj.lance_interrupt_spear_spin_r.frame matches 77 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_interrupt_spear_spin_r.frame matches 97 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_interrupt_spear_spin_r.frame matches 97 run particle block{block_state:"minecraft:sand"} ^ ^ ^2 2 0.1 2 0 30

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_interrupt_spear_spin_r.frame matches 108 run function mhdp_monster_valk:core/tick/animation/event/lance_interrupt_spear_spin_r/end
