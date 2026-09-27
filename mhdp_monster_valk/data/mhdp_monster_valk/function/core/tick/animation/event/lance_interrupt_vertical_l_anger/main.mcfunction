#> mhdp_monster_valk:core/tick/animation/event/lance_interrupt_vertical_l_anger/main
#
# アニメーションイベントハンドラ 割り込み 翼槍叩きつけ L (怒り)
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    #TODO: ダミー。終了フレームは仮値
    execute if score @s aj.lance_interrupt_vertical_l_anger.frame matches 20 run function mhdp_monster_valk:core/tick/animation/event/lance_interrupt_vertical_l_anger/end
