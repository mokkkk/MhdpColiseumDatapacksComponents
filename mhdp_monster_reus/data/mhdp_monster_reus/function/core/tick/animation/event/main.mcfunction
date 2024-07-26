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
    # 通常
        execute if entity @s[tag=aj.reus_aj.animation.land_voice.playing] run function mhdp_monster_reus:core/tick/animation/event/land_voice/main
    # 地上怒り
        execute if entity @s[tag=aj.reus_aj.animation.land_anger.playing] run function mhdp_monster_reus:core/tick/animation/event/land_anger/main
    # 空中怒り
        execute if entity @s[tag=aj.reus_aj.animation.fly_anger.playing] run function mhdp_monster_reus:core/tick/animation/event/fly_anger/main

# 怯み
    # 地上
        # 頭
            execute if entity @s[tag=aj.reus_aj.animation.land_damage_head.playing] run function mhdp_monster_reus:core/tick/animation/event/land_damage_head/main
        # 胴・足
            execute if entity @s[tag=aj.reus_aj.animation.land_damage_r.playing] run function mhdp_monster_reus:core/tick/animation/event/land_damage_r/main
            execute if entity @s[tag=aj.reus_aj.animation.land_damage_l.playing] run function mhdp_monster_reus:core/tick/animation/event/land_damage_l/main
        # 尻尾
            execute if entity @s[tag=aj.reus_aj.animation.land_damage_tail.playing] run function mhdp_monster_reus:core/tick/animation/event/land_damage_tail/main
            execute if entity @s[tag=aj.reus_aj.animation.land_damage_back.playing] run function mhdp_monster_reus:core/tick/animation/event/land_damage_back/main
        # ダウン

        
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

# 急襲
    execute if entity @s[tag=aj.reus_aj.animation.fly_assault.playing] run function mhdp_monster_reus:core/tick/animation/event/fly_assault/main

# 移動ブレス
    execute if entity @s[tag=aj.reus_aj.animation.fly_movebreath_r.playing] run function mhdp_monster_reus:core/tick/animation/event/fly_movebreath_r/main
    execute if entity @s[tag=aj.reus_aj.animation.fly_movebreath_l.playing] run function mhdp_monster_reus:core/tick/animation/event/fly_movebreath_l/main

# なぎはらい火炎放射
    execute if entity @s[tag=aj.reus_aj.animation.fly_flame_sweep.playing] run function mhdp_monster_reus:core/tick/animation/event/fly_flame_sweep/main

# 3連ブレス
    execute if entity @s[tag=aj.reus_aj.animation.fly_breath_triple.playing] run function mhdp_monster_reus:core/tick/animation/event/fly_breath_triple/main

# 地走り火炎
    execute if entity @s[tag=aj.reus_aj.animation.fly_flame_vertical.playing] run function mhdp_monster_reus:core/tick/animation/event/fly_flame_vertical/main

# 着地
    execute if entity @s[tag=aj.reus_aj.animation.fly_end.playing] run function mhdp_monster_reus:core/tick/animation/event/fly_end/main
