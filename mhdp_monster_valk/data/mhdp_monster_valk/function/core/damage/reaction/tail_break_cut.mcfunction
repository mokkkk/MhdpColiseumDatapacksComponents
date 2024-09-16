#> mhdp_monster_valk:core/damage/reaction/tail_break_cut
#
# 怯みリアクション 尻尾部位破壊
#
# @within function mhdp_monster_valk:core/damage/damage

# 状態更新
    # tag @s add Mns.Break.Tail 
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
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/damage/reaction/macro/m.summon_tail with entity @s data.locators.tail_4

# トースト表示
    function mhdp_monster_valk:core/util/show_toast
