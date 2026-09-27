#> mhdp_monster_valk:core/tick/animation/event/lance_interrupt_flytackle/main
#
# アニメーションイベントハンドラ 割り込み 滑空突進
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    #TODO: ダミー。終了フレームは仮値
    execute if score @s aj.lance_interrupt_flytackle.frame matches 20 run function mhdp_monster_valk:core/tick/animation/event/lance_interrupt_flytackle/end
