#> mhdp_monster_dino:core/tick/main
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# Animated Java側処理
    function animated_java:global/data_manager/on_tick
    function animated_java:global/root/on_tick

# 共通tick開始時処理
    function mhdp_monsters:core/super/tick/pre_tick

# 共通tick中処理
    function mhdp_monsters:core/super/tick/in_tick

# tick中処理
    # 非発見時
        execute if score @s Mns.General.Phase matches 0 run function mhdp_monster_dino:core/tick/on_relax/tick
    # 警戒時
        execute if score @s Mns.General.Phase matches 1 run function mhdp_monster_dino:core/tick/on_caution/tick
    # 戦闘時
        execute if score @s Mns.General.Phase matches 2 run function mhdp_monster_dino:core/tick/on_battle/tick
    # function mhdp_monsters:core/util/tick/tick

# アニメーションイベントハンドラ
    function mhdp_monster_dino:core/tick/animation/event/main

# その他演出
    # 怒り中・頭部の演出
        # execute if entity @s[tag=Mns.State.IsAnger] on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/effect_anger with entity @s data.locators.pos_head

# 共通tick終了時処理
    function mhdp_monsters:core/super/tick/post_tick
