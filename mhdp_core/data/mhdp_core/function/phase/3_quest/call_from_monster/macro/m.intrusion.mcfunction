#> mhdp_core:phase/3_quest/call_from_monster/macro/m.intrusion
#
# モンスターから呼び出す処理 HP半減時
#
# @within function mhdp_core:phase/3_quest/call_from_monster/check_monster_summon_condition_half

# 位置決定
    summon marker ~ ~ ~ {Tags:["Mk.Field.SummonPos"]}
    execute positioned as @e[type=marker,tag=Mk.Field.Center] run spreadplayers ~ ~ 10 20 under 95 false @e[type=marker,tag=Mk.Field.SummonPos]

# 乱入処理実行
    execute positioned as @e[type=marker,tag=Mk.Field.SummonPos,sort=random,limit=1] run function mhdp_monsters:core/switch/intrusion

# 位置リセット
    kill @e[type=marker,tag=Mk.Field.SummonPos]
