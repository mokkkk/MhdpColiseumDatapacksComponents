#> mhdp_monster_karakuri:core/tick/animation/change/main
#
# アニメーション変更処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# モードに応じてアニメーションを再生する
    execute if entity @s[tag=Mns.Karakuri.Mode.Idle] run function animated_java:karakuri_aj/animations/idle/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.Karakuri.Mode.Attack] run function animated_java:karakuri_aj/animations/bite/tween {duration:1, to_frame: 0}

# 終了
    scoreboard players set @s Mns.General.DummyTimer 0
