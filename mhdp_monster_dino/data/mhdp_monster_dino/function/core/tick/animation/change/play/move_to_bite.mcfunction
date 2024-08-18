#> mhdp_monster_dino:core/tick/animation/change/play/move_to_bite
#
# アニメーション変更処理 移動
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 移動
    tag @s add Anim.Move
    tag @s add Mns.Dino.Temp.ToBite

# 移動回数設定
    scoreboard players set @s Mns.Dino.DashCount 8
