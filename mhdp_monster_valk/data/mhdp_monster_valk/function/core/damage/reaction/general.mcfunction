#> mhdp_monster_valk:core/damage/reaction/general
#
# 怯みリアクション 共通処理
#
# @within function mhdp_monster_valk:core/damage/damage

# アニメーション判別用タグ消去
    tag @s remove Mns.Valk.State.Attack.Head
    tag @s remove Mns.Valk.State.Attack.Wing.R
    tag @s remove Mns.Valk.State.Attack.Wing.L

# 状態更新
    tag @s add Mns.Temp.IsDamaged

# 演出リセット
    kill @e[type=text_display,tag=Mns.Shot.Valk.Vfx.RedFlash.Long]
    function mhdp_monster_valk:core/util/models/model_interrupt
