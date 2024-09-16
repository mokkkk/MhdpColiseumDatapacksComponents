#> mhdp_monster_valk:core/damage/reaction/arm_l_break
#
# 怯みリアクション 頭部位破壊
#
# @within function mhdp_monster_valk:core/damage/damage

# 状態更新
    tag @s add Mns.Break.Arm.L

# 効果音
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9

# モデル変更
    function mhdp_monster_valk:core/util/models/break_arm_left

# トースト表示
    function mhdp_monster_valk:core/util/show_toast
