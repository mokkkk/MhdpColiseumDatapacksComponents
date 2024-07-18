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

# 突進
    # 開始
        execute if entity @s[tag=aj.reus_aj.animation.land_dash_start.playing] run function mhdp_monster_reus:core/tick/animation/event/land_dash_start/main
        execute if entity @s[tag=aj.reus_aj.animation.land_dash_start_turn_r.playing] run function mhdp_monster_reus:core/tick/animation/event/land_dash_start_turn_r/main
        execute if entity @s[tag=aj.reus_aj.animation.land_dash_start_turn_l.playing] run function mhdp_monster_reus:core/tick/animation/event/land_dash_start_turn_l/main
    # 突進
        execute if entity @s[tag=aj.reus_aj.animation.land_dash.playing] run function mhdp_monster_reus:core/tick/animation/event/land_dash/main
    # 終了
        execute if entity @s[tag=aj.reus_aj.animation.land_dash_bite.playing] run function mhdp_monster_reus:core/tick/animation/event/land_dash_bite/main

# 尻尾回転
    execute if entity @s[tag=aj.reus_aj.animation.land_tail_spin_r.playing] run function mhdp_monster_reus:core/tick/animation/event/land_tail_spin_r/main
    execute if entity @s[tag=aj.reus_aj.animation.land_tail_spin_l.playing] run function mhdp_monster_reus:core/tick/animation/event/land_tail_spin_l/main

# 噛みつき
    execute if entity @s[tag=aj.reus_aj.animation.land_bite_r.playing] run function mhdp_monster_reus:core/tick/animation/event/land_bite_r/main
    execute if entity @s[tag=aj.reus_aj.animation.land_bite_l.playing] run function mhdp_monster_reus:core/tick/animation/event/land_bite_l/main

# チャージ噛みつき
    execute if entity @s[tag=aj.reus_aj.animation.land_chargebite.playing] run function mhdp_monster_reus:core/tick/animation/event/land_chargebite/main

# 攻撃後後隙
    execute if entity @s[tag=aj.reus_aj.animation.land_after_attack.playing] run function mhdp_monster_reus:core/tick/animation/event/land_after_attack/main

# 床ドン
    execute if entity @s[tag=aj.reus_aj.animation.land_jump.playing] run function mhdp_monster_reus:core/tick/animation/event/land_jump/main
