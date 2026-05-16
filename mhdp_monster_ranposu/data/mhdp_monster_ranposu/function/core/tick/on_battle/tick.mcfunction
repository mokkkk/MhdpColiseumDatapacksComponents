#> mhdp_monster_ranposu:core/tick/on_battle/tick
#
# tick処理 戦闘中
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ヘイト更新
    execute if entity @s[tag=Mns.Temp.IsTick] run function mhdp_monster_ranposu:core/tick/on_battle/update_hate
