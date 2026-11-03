#> mhdp_monster_reus:core/tick/animation/event/main
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_reus:core/tick/main

# ※ 再生中アニメの .playing タグを見て、event/<anim>/main を呼ぶだけのディスパッチャ
# ※ 存在しない関数を呼ぶ行があるとこのファイル自体が読み込まれず、core/tick/main も動かなくなる。
#   event/<anim>/ を実装したアニメの行だけコメントを外すこと

## 非発見時

# 待機
    # execute if entity @s[tag=animated_java_reus.reus.animation.idle_relax.playing] run function mhdp_monster_reus:core/tick/animation/event/idle_relax/main
# 移動
    # execute if entity @s[tag=animated_java_reus.reus.animation.walk_relax.playing] run function mhdp_monster_reus:core/tick/animation/event/walk_relax/main
# 生態行動
    # execute if entity @s[tag=animated_java_reus.reus.animation.ecology_relax.playing] run function mhdp_monster_reus:core/tick/animation/event/ecology_relax/main
    # execute if entity @s[tag=animated_java_reus.reus.animation.ecology_relax_long.playing] run function mhdp_monster_reus:core/tick/animation/event/ecology_relax_long/main

## 警戒時

# 探索
    # execute if entity @s[tag=animated_java_reus.reus.animation.search.playing] run function mhdp_monster_reus:core/tick/animation/event/search/main

## 戦闘時

# 待機
    # execute if entity @s[tag=animated_java_reus.reus.animation.land_idle.playing] run function mhdp_monster_reus:core/tick/animation/event/land_idle/main
# 咆哮
    # execute if entity @s[tag=animated_java_reus.reus.animation.land_voice.playing] run function mhdp_monster_reus:core/tick/animation/event/land_voice/main
# 怒り
    # execute if entity @s[tag=animated_java_reus.reus.animation.land_anger.playing] run function mhdp_monster_reus:core/tick/animation/event/land_anger/main
# 軸合わせ
    # execute if entity @s[tag=animated_java_reus.reus.animation.land_turn_left.playing] run function mhdp_monster_reus:core/tick/animation/event/land_turn_left/main
    # execute if entity @s[tag=animated_java_reus.reus.animation.land_turn_right.playing] run function mhdp_monster_reus:core/tick/animation/event/land_turn_right/main

## 攻撃 (技を追加したら追記)

## 怯み・状態異常

# 怯み
    # execute if entity @s[tag=animated_java_reus.reus.animation.damage_head.playing] run function mhdp_monster_reus:core/tick/animation/event/damage_head/main
    # execute if entity @s[tag=animated_java_reus.reus.animation.damage_left.playing] run function mhdp_monster_reus:core/tick/animation/event/damage_left/main
    # execute if entity @s[tag=animated_java_reus.reus.animation.damage_right.playing] run function mhdp_monster_reus:core/tick/animation/event/damage_right/main
# 相殺
    # execute if entity @s[tag=animated_java_reus.reus.animation.damage_counter_start.playing] run function mhdp_monster_reus:core/tick/animation/event/damage_counter_start/main
# ダウン
    # execute if entity @s[tag=animated_java_reus.reus.animation.damage_down_left.playing] run function mhdp_monster_reus:core/tick/animation/event/damage_down_left/main
    # execute if entity @s[tag=animated_java_reus.reus.animation.damage_down_right.playing] run function mhdp_monster_reus:core/tick/animation/event/damage_down_right/main
# 麻痺
    # execute if entity @s[tag=animated_java_reus.reus.animation.state_paralysis.playing] run function mhdp_monster_reus:core/tick/animation/event/state_paralysis/main

## 討伐

    # execute if entity @s[tag=animated_java_reus.reus.animation.death.playing] run function mhdp_monster_reus:core/tick/animation/event/death/main
