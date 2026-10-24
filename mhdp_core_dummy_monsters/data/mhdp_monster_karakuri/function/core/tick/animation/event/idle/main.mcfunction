#> mhdp_monster_karakuri:core/tick/animation/event/idle/main
#
# アニメーションイベントハンドラ 待機・威嚇
#
# @within function mhdp_monster_karakuri:core/tick/animation/event/tick

# 接地

# 終了
    execute if score @s animated_java_karakuri.karakuri.idle.frame matches 57 run function mhdp_monster_karakuri:core/tick/animation/event/idle/end

# デバッグ用
    # tellraw @a [{"text": "animated_java_karakuri.karakuri.idle.frame : "},{"score":{"name":"@s","objective":"animated_java_karakuri.karakuri.idle.frame"}}]
