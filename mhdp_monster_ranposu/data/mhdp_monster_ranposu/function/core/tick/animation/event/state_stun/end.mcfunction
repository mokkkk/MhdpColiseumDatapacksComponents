#> mhdp_monster_ranposu:core/tick/animation/event/state_stun/end
#
# アニメーションイベントハンドラ スタン
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# カウント
    scoreboard players remove @s Mns.General.DownCount 1

# ダウン継続
    execute if score @s Mns.General.DownCount matches 1.. run return run function animated_java:ranposu_aj/animations/state_stun/tween {duration:1, to_frame: 1}

# 起き上がり
    function animated_java:ranposu_aj/animations/state_stun_end/tween {duration:1, to_frame: 1}
