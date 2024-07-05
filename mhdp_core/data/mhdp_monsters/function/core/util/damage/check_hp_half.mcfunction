#> mhdp_monsters:core/util/damage/check_hp_half
# 
# 汎用処理 被ダメージ
#
# @within function mhdp_monsters:/**

# クエストのHP半減時処理を呼び出す
    execute store result storage mhdp_core:temp Arg.MonsterUid int 1 run scoreboard players get @s Mns.Uid
    function mhdp_core:phase/3_quest/call_from_monster/half

# 終了
    tag @s add Mns.State.HpHalf
