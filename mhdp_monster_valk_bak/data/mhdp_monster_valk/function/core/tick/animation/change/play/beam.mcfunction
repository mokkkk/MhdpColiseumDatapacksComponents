#> mhdp_monster_valk:core/tick/animation/change/play/beam
#
# アニメーション変更処理 軸合わせ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# カウンターリセット
    scoreboard players set @s Mns.Valk.PhaseCount.Beam 0

# 再生アニメーション決定
    tag @s add Anim.Beam

# 終了
