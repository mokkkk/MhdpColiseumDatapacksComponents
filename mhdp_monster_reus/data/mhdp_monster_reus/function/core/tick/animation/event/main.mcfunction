#> mhdp_monster_reus:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_reus:core/tick/tick

# 待機
    execute if entity @s[tag=aj.reus_aj.animation.land_idle.playing] run function mhdp_monster_reus:core/tick/animation/event/land_idle/main
    execute if entity @s[tag=aj.reus_aj.animation.fly_idle.playing] run function mhdp_monster_reus:core/tick/animation/event/fly_idle/main

# 探索
    execute if entity @s[tag=aj.reus_aj.animation.search.playing] run function mhdp_monster_reus:core/tick/animation/event/search/main

# 咆哮
    execute if entity @s[tag=aj.reus_aj.animation.land_voice.playing] run function mhdp_monster_reus:core/tick/animation/event/land_voice/main
    execute if entity @s[tag=aj.reus_aj.animation.fly_anger.playing] run function mhdp_monster_reus:core/tick/animation/event/fly_anger/main

# 軸合わせ
    execute if entity @s[tag=aj.reus_aj.animation.land_turn_r.playing] run function mhdp_monster_reus:core/tick/animation/event/land_turn_r/main
    execute if entity @s[tag=aj.reus_aj.animation.land_turn_l.playing] run function mhdp_monster_reus:core/tick/animation/event/land_turn_l/main
    execute if entity @s[tag=aj.reus_aj.animation.fly_turn.playing] run function mhdp_monster_reus:core/tick/animation/event/fly_turn/main

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

# バックステップ
    execute if entity @s[tag=aj.reus_aj.animation.land_backstep.playing] run function mhdp_monster_reus:core/tick/animation/event/land_backstep/main

# ブレス
    execute if entity @s[tag=aj.reus_aj.animation.land_breath.playing] run function mhdp_monster_reus:core/tick/animation/event/land_breath/main

# 移動
    execute if entity @s[tag=aj.reus_aj.animation.land_move.playing] run function mhdp_monster_reus:core/tick/animation/event/land_move/main

# 飛行開始
    execute if entity @s[tag=aj.reus_aj.animation.land_to_fly.playing] run function mhdp_monster_reus:core/tick/animation/event/land_to_fly/main

# バックジャンプブレス
    execute if entity @s[tag=aj.reus_aj.animation.land_bjb.playing] run function mhdp_monster_reus:core/tick/animation/event/land_bjb/main

# 飛行回り込み
    execute if entity @s[tag=aj.reus_aj.animation.fly_move_right.playing] run function mhdp_monster_reus:core/tick/animation/event/fly_move_right/main
    execute if entity @s[tag=aj.reus_aj.animation.fly_move_left.playing] run function mhdp_monster_reus:core/tick/animation/event/fly_move_left/main

# ひっかき
    execute if entity @s[tag=aj.reus_aj.animation.fly_attack.playing] run function mhdp_monster_reus:core/tick/animation/event/fly_attack/main

# 飛行噛みつき
    execute if entity @s[tag=aj.reus_aj.animation.fly_bite.playing] run function mhdp_monster_reus:core/tick/animation/event/fly_bite/main

# 飛行尻尾なぎはらい
    execute if entity @s[tag=aj.reus_aj.animation.fly_tail.playing] run function mhdp_monster_reus:core/tick/animation/event/fly_tail/main