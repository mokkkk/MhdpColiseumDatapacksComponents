#> mhdp_monster_ranposu:core/tick/tick
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タイマー
    # scoreboard players add @s Mns.General.AnimationTimer 1

# 行動決定
    # function mhdp_monster_ranposu:core/tick/animation/change/main

# アニメーションイベントハンドラ
    function mhdp_monster_ranposu:core/tick/animation/event/main

# その他演出
    # 怒り中・頭部の演出
