#> mhdp_monster_ranposu:core/tick/animation/change/interrupt
#
# アニメーション処理 割り込み
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タグ付与
    # tag @s add Anim.Bite

# 軸合わせ
    tag @s add Mns.Temp.IsTurn
    # function mhdp_monster_ranposu:core/tick/animation/change/play/turn

# アニメーション変更
    function mhdp_monster_ranposu:core/tick/animation/change/main
    # function mhdp_monster_ranposu:core/tick/animation/change/play/main
