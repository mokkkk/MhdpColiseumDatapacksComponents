#> mhdp_monster_ranposu:core/tick/animation/event/state_stun_end/end
#
# アニメーションイベントハンドラ スタン終了
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/state_stun_end/main

# 状態リセット
    tag @s remove Mns.State.IsDown
    tag @s remove Mns.State.IsStun
    tag @s remove Mns.State.IsParalysis

# 行動選択
    function mhdp_monster_ranposu:core/tick/animation/change/main
