#> mhdp_monster_karakuri:core/tick/tick_main
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# Animated Java側処理
    function animated_java:global/data_manager/on_tick
    function animated_java:global/root/on_tick

# 共通tick開始時処理
    # function mhdp_monsters:core/super/tick/pre_tick

# 共通tick中処理
    # function mhdp_monsters:core/super/tick/in_tick

# tick中処理
    # 非発見時
        # execute if score @s Mns.General.Phase matches 0 run function mhdp_monster_karakuri:core/tick/on_relax/tick
    # 警戒時
        # execute if score @s Mns.General.Phase matches 1 run function mhdp_monster_karakuri:core/tick/on_caution/tick
    # 戦闘時
        # execute if score @s Mns.General.Phase matches 2 run function mhdp_monster_karakuri:core/tick/on_battle/tick
    # function mhdp_monsters:core/util/tick/tick

# アニメーションイベントハンドラ
    function mhdp_monster_karakuri:core/tick/animation/event/main

# 一定時間ごとに行動
    scoreboard players add @s Mns.General.DummyTimer 1
    execute if score @s Mns.General.DummyTimer matches 100.. run function mhdp_monster_karakuri:core/tick/animation/change/main
