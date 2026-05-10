#> mhdp_monster_ranposu:core/tick/main
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# Animated Java側処理
    function animated_java:ranposu/root/on_tick

# 共通tick開始時処理
    function mhdp_monsters:core/super/tick/pre_tick

# tick中処理
    # 非発見時
        execute if score @s Mns.General.Phase matches 0 run function mhdp_monster_ranposu:core/tick/on_relax/tick
    # 警戒時
        execute if score @s Mns.General.Phase matches 1
    # 戦闘時
        execute if score @s Mns.General.Phase matches 2
    # function mhdp_monsters:core/util/tick/tick

# 共通tick中処理
    function mhdp_monsters:core/super/tick/in_tick

# アニメーションイベントハンドラ
    function mhdp_monster_ranposu:core/tick/animation/event/main

# その他演出
    # 怒り中・頭部の演出
        # execute if entity @s[tag=Mns.State.IsAnger] on passengers if entity @s[tag=aj.data] run function mhdp_monster_ranposu:core/tick/effect_anger with entity @s data.locators.pos_head

# 共通tick終了時処理
    function mhdp_monsters:core/super/tick/post_tick

# 共通処理
    # function mhdp_monsters:core/util/tick/post_tick
