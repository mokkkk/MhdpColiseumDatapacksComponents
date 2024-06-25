#> mhdp_monster_ranposu:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 待機
    execute if entity @s[tag=aj.ranposu_aj.animation.idle.playing] if score @s aj.frame matches 1 run say I am ドスランポス...
    # execute if score @s aj.frame matches 1..
