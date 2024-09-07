#> mhdp_monster_valk:core/tick/animation/change/interrupt
#
# アニメーション処理 割り込み
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タグ付与
    tag @s add Anim.VerticalS.L
    # function mhdp_monster_valk:core/tick/animation/change/play/change_phase

# 軸合わせ
    # tag @s add Mns.Temp.IsTurn

# アニメーション変更
    function mhdp_monster_valk:core/tick/animation/change/main
