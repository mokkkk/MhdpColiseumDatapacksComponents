#> mhdp_monster_reus:core/damage/break/head
#
# 部位破壊 頭
#
# @within function mhdp_monster_reus:core/damage/reaction/head

# 状態更新
    tag @s add Mns.Break.Head

# 効果音
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9

# モデル変更 (util/models/break_head を作成してから有効化する)
    # function mhdp_monster_reus:core/util/models/break_head

# トースト表示
    function mhdp_monster_reus:core/util/show_toast
