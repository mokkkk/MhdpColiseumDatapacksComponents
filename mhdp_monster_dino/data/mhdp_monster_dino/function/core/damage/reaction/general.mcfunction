#> mhdp_monster_dino:core/damage/reaction/general
#
# 怯みリアクション 共通処理
#
# @within function mhdp_monster_dino:core/damage/damage

# アニメーション判別用タグ消去
    tag @s remove Mns.Dino.State.Attack.Head
    tag @s remove Mns.Dino.State.Attack.Tail.R
    tag @s remove Mns.Dino.State.Attack.Tail.L

# 状態更新
    tag @s add Mns.Temp.IsDamaged
