#> mhdp_monster_dino:core/tick/animation/change/interrupt
#
# アニメーション処理 割り込み
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タグ付与
    # tag @s add Anim.Polish
    function mhdp_monster_dino:core/tick/animation/change/play/tail_flame

# 軸合わせ
    # tag @s add Mns.Temp.IsTurn
    # tag @s add Mns.Temp.IsTurn.Big

# アニメーション変更
    function mhdp_monster_dino:core/tick/animation/change/main
