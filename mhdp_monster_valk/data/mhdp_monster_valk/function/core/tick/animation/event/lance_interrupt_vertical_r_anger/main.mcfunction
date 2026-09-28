#> mhdp_monster_valk:core/tick/animation/event/lance_interrupt_vertical_r_anger/main
#
# アニメーションイベントハンドラ 割り込み 翼槍叩きつけ R (怒り)
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.lance_interrupt_vertical_r_anger.frame matches 1..5 at @s run tp @s ^ ^ ^-0.4
    execute if score @s aj.lance_interrupt_vertical_r_anger.frame matches 6..10 at @s run tp @s ^ ^ ^-0.2
    execute if score @s aj.lance_interrupt_vertical_r_anger.frame matches 11..15 at @s run tp @s ^ ^ ^-0.08

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_interrupt_vertical_r_anger.frame matches 20 run function mhdp_monster_valk:core/tick/animation/event/lance_interrupt_vertical_r_anger/end
