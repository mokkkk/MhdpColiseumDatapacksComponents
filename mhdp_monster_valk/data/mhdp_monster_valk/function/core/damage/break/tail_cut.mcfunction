#> mhdp_monster_valk:core/damage/break/tail_cut
#
# 怯みリアクション 尻尾部位破壊 (切断)
#
# @within function mhdp_monster_valk:core/damage/damage

# 状態更新
    tag @s add Mns.Break.Tail
    tag @s add Mns.Break.Tail.Cut
    tag @s add Mns.Valk.Temp.Tail.Break

# ダウン・スタン・麻痺・罠をキャンセルする
    tag @s remove Mns.State.IsDown
    tag @s remove Mns.State.IsStun
    tag @s remove Mns.State.IsParalysis
    tag @s remove Mns.State.IsParalyseTrap
    tag @s remove Mns.State.IsHallTrap

# 効果音
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9

# モデル変更
    function mhdp_monster_valk:core/util/models/break_tail_cut

# 尻尾設置
    #TODO: 切断尻尾エンティティの設置は Stage 6 の弾システム再構築時に対応
    #      (assets の ObjectId 定義 + api:object/summon.m 経由に置き換え / locator は tail_4 = as_locator)

# トースト表示
    function mhdp_monster_valk:core/util/show_toast
