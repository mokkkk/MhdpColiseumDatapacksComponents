#> mhdp_monster_dino:core/tick/animation/event/tail_back_l/combo
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_dino:core/tick/animation/event/idle/main

# 対象が正面にいない場合、キャンセル
    execute facing entity @n[tag=Mns.Target.Dino] feet rotated ~ 0 positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 unless entity @s[distance=..1.3] run return 0

# ブレスに遷移
    function animated_java:dino_aj/animations/breath/tween {duration:5, to_frame: 2}
