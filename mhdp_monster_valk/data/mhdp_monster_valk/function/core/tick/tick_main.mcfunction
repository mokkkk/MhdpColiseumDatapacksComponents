#> mhdp_monster_valk:core/tick/tick_main
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# Animated Java側処理
    function animated_java:valk_aj/root/on_tick

# 共通処理
    function mhdp_monsters:core/util/tick/tick

# アニメーションイベントハンドラ
    function mhdp_monster_valk:core/tick/animation/event/main

# その他演出
    # 怒り中演出
        execute if entity @s[tag=Mns.State.IsAnger] run function mhdp_monster_valk:core/tick/effect_anger
