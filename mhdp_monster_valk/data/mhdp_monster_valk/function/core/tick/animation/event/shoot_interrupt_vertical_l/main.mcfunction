#> mhdp_monster_valk:core/tick/animation/event/shoot_interrupt_vertical_l/main
#
# アニメーションイベントハンドラ 割り込み 翼叩きつけ L
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    #TODO: ダミー。終了フレームは仮値
    execute if score @s aj.shoot_interrupt_vertical_l.frame matches 20 run function mhdp_monster_valk:core/tick/animation/event/shoot_interrupt_vertical_l/end
