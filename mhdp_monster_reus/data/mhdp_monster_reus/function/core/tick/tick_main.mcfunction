#> mhdp_monster_reus:core/tick/tick_main
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# Animated Java側処理
    # function animated_java:global/on_tick

# 共通処理
    function mhdp_monsters:core/util/tick/tick

# アニメーションイベントハンドラ
    function mhdp_monster_reus:core/tick/animation/event/main

# その他演出
    # 怒り中・頭部の演出
        execute if entity @s[tag=Mns.State.IsAnger] on passengers if entity @s[tag=aj.data] run function mhdp_monster_reus:core/tick/effect_anger with entity @s data.locators.pos_head
