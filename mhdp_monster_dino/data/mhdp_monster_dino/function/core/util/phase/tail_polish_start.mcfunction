#> mhdp_monster_dino:core/util/phase/tail_polish_start
#
# 尻尾研ぎ
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# カウントリセット
    scoreboard players set @s Mns.Dino.PhaseCount.Tail 0

# アニメーション再生
    function animated_java_dino:dino/animations/polish/tween {duration:1, to_frame: 0}
    tag @s add Mns.Temp.IsAlreadyAnimation
