#> mhdp_monster_ranposu:core/tick/animation/change/random/main
#
# 行動ランダム選択
#
# @within function mhdp_monster_ranposu:core/tick/animation/change/main

# 初回発見時
    execute if entity @s[tag=Mns.Temp.IsFirstContact] run return run function mhdp_monster_ranposu:core/tick/animation/change/random/first

# 近距離
    function mhdp_monster_ranposu:core/tick/animation/change/random/near
