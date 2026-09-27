#> mhdp_monster_valk:core/tick/animation/event/lance_interrupt_spear_spin_r/main
#
# アニメーションイベントハンドラ 割り込み 翼槍回転斬り R
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    #TODO: ダミー。終了フレームは仮値
    execute if score @s aj.lance_interrupt_spear_spin_r.frame matches 20 run function mhdp_monster_valk:core/tick/animation/event/lance_interrupt_spear_spin_r/end
