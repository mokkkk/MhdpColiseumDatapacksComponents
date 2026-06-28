#> mhdp_monster_ranposu:core/tick/animation/event/interrupt_object/main
#
# アニメーションイベントハンドラ 怯み・建築物攻撃
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 移動
    execute if score @s aj.interrupt_object.frame matches 1..5 at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.interrupt_object.frame matches 6..9 at @s run tp @s ^ ^ ^-0.1

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.interrupt_object.frame matches 33 run function mhdp_monster_ranposu:core/tick/animation/event/interrupt_object/end
