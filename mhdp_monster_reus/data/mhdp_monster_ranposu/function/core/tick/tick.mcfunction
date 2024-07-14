#> mhdp_monster_ranposu:core/tick/tick
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 共通処理
    function mhdp_monsters:core/util/tick/tick

# アニメーションイベントハンドラ
    function mhdp_monster_ranposu:core/tick/animation/event/main

# その他演出
    # 怒り中・頭部の演出
        execute if entity @s[tag=Mns.State.IsAnger] on passengers if entity @s[tag=aj.data] run function mhdp_monster_ranposu:core/tick/effect_anger with entity @s data.locators.pos_head
