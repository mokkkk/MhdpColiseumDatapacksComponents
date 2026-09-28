#> mhdp_monster_valk:core/tick/on_battle/tick
#
# tick処理 戦闘中 (Phase 2)
#
# @within function mhdp_monster_valk:core/tick/main

# ヘイト更新
    execute if entity @s[tag=Mns.Temp.IsTick] run function mhdp_monster_valk:core/tick/on_battle/update_hate
