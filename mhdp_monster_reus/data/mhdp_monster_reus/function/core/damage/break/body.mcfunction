#> mhdp_monster_reus:core/damage/break/body
#
# 部位破壊 胴
#
# @within function mhdp_monster_reus:core/damage/reaction/body

# 状態更新
    tag @s add Mns.Break.Body

# 効果音
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9

# モデル変更 (util/models/break_body を作成してから有効化する)
    # function mhdp_monster_reus:core/util/models/break_body

# トースト表示
    function mhdp_monster_reus:core/util/show_toast
