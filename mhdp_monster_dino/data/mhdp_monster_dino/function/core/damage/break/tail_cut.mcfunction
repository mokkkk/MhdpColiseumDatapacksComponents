#> mhdp_monster_dino:core/damage/break/tail_cut
#
# 怯みリアクション 尻尾部位破壊・切断
#
# @within function mhdp_monster_dino:core/damage/damage

# 状態更新
    tag @s add Mns.Break.Tail.Cut
    
# アニメーション再生用の一時タグ
    tag @s add Mns.Temp.IsDamage.TailCut

# 効果音
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9

# モデル変更
    function mhdp_monster_dino:core/util/models/break_tail_cut

# トースト表示
    function mhdp_monster_dino:core/util/show_toast
