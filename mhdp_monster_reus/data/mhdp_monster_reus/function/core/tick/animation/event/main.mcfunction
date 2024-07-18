#> mhdp_monster_reus:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_reus:core/tick/tick

# 待機
    execute if entity @s[tag=aj.reus_aj.animation.land_idle.playing] run function mhdp_monster_reus:core/tick/animation/event/land_idle/main

# 探索
    execute if entity @s[tag=aj.reus_aj.animation.search.playing] run function mhdp_monster_reus:core/tick/animation/event/search/main

# 咆哮
    execute if entity @s[tag=aj.reus_aj.animation.land_voice.playing] run function mhdp_monster_reus:core/tick/animation/event/land_voice/main

# 軸合わせ
    execute if entity @s[tag=aj.reus_aj.animation.land_turn_r.playing] run function mhdp_monster_reus:core/tick/animation/event/land_turn_r/main
    execute if entity @s[tag=aj.reus_aj.animation.land_turn_l.playing] run function mhdp_monster_reus:core/tick/animation/event/land_turn_l/main
