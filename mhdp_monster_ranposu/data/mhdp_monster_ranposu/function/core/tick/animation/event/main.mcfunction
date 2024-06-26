#> mhdp_monster_ranposu:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 待機
    execute if entity @s[tag=aj.ranposu_aj.animation.idle.playing] run function mhdp_monster_ranposu:core/tick/animation/event/idle/main

# 軸合わせ
    execute if entity @s[tag=aj.ranposu_aj.animation.turn_right.playing] run function mhdp_monster_ranposu:core/tick/animation/event/turn_right/main
    execute if entity @s[tag=aj.ranposu_aj.animation.turn_left.playing] run function mhdp_monster_ranposu:core/tick/animation/event/turn_left/main

# 咆哮
    execute if entity @s[tag=aj.ranposu_aj.animation.voice.playing] run function mhdp_monster_ranposu:core/tick/animation/event/voice/main
