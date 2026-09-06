#> mhdp_monster_valk:core/tick/main
#
# tick処理 本体
#
# @within function mhdp_monster_valk:core/tick/tick

# Animated Java側処理
    function animated_java:global/data_manager/on_tick
    function animated_java:global/root/on_tick

# 共通tick開始時処理
    function mhdp_monsters:core/super/tick/pre_tick

# 共通tick中処理
    function mhdp_monsters:core/super/tick/in_tick

# tick中処理
    # 非発見時
        # execute if score @s Mns.General.Phase matches 0 run function mhdp_monster_valk:core/tick/on_relax/tick
    # 警戒時
        # execute if score @s Mns.General.Phase matches 1 run function mhdp_monster_valk:core/tick/on_caution/tick
    # 戦闘時
        # execute if score @s Mns.General.Phase matches 2 run function mhdp_monster_valk:core/tick/on_battle/tick

# アニメーションイベントハンドラ
    function mhdp_monster_valk:core/tick/animation/event/main

# その他演出
    # 怒り中演出 (valk 固有)
        execute if entity @s[tag=Mns.State.IsAnger] run function mhdp_monster_valk:core/tick/effect_anger

# 共通tick終了時処理
    function mhdp_monsters:core/super/tick/post_tick
