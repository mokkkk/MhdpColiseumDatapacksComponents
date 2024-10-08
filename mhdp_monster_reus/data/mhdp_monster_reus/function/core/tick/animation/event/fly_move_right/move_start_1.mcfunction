#> mhdp_monster_reus:core/tick/animation/event/land_backstep/move_start
#
# アニメーションイベントハンドラ バックステップ
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_backstep/main

# 移動対象取得
    tag @n[tag=Mns.Target.Reus] add Temp.Move.Target

# ターゲット配置
    execute positioned as @n[tag=Mns.Target.Reus] rotated ~90 0 run summon marker ^ ^1 ^7 {Tags:["Temp.Move.Target.Marker"]}
    execute as @n[type=marker,tag=Temp.Move.Target.Marker] at @s run function mhdp_monsters:core/util/other/on_ground
    execute as @n[type=marker,tag=Temp.Move.Target.Marker] at @s run tp @s ~ ~2 ~

# 移動ベクトル計算
    scoreboard players set #mhdp_temp_move_tick MhdpCore 10
    function mhdp_monsters:core/util/other/move_to_target_calc

# 終了
    tag @n[tag=Temp.Move.Target] remove Temp.Move.Target
