#> mhdp_monster_valk:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_valk:core/tick/tick



# 警戒
    # execute if entity @s[tag=aj.valk_aj.animation.search.playing] run function mhdp_monster_valk:core/tick/animation/event/search/main

## 彗龍
# 待機
    # execute if entity @s[tag=aj.valk_aj.animation.idle.playing] run function mhdp_monster_valk:core/tick/animation/event/idle/main

# 咆哮
    execute if entity @s[tag=aj.valk_aj.animation.lance_voice.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_voice/main

# 軸合わせ
    execute if entity @s[tag=aj.valk_aj.animation.lance_turn_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_turn_r/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_turn_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_turn_l/main

# 2連突き
    execute if entity @s[tag=aj.valk_aj.animation.lance_spear_l_to_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/main
