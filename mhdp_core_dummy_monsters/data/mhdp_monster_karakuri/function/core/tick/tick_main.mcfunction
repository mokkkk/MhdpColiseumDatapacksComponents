#> mhdp_monster_karakuri:core/tick/tick_main
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# Animated Java側処理
    function animated_java:karakuri_aj/root/on_tick

# 共通処理
    # 移動などしないため、不要
    # function mhdp_monsters:core/util/tick/tick

# アニメーションイベントハンドラ
    function mhdp_monster_karakuri:core/tick/animation/event/main

# 一定時間ごとに行動
    scoreboard players add @s Mns.General.DummyTimer 1
    execute if score @s Mns.General.DummyTimer matches 100.. run function mhdp_monster_karakuri:core/tick/animation/change/main
