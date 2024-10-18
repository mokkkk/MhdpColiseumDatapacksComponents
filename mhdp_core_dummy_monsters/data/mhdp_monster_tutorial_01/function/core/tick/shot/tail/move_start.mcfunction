#> mhdp_monster_dino:core/tick/shot/tail/move_start
#
# 尻尾tick処理
#
# @within function mhdp_monster_dino:core/tick/shot/tail/tick

# ターゲット配置
    summon marker ^5 ^ ^-6 {Tags:["Temp.Move.Target.Marker"]}
    execute as @e[type=marker,tag=Temp.Move.Target.Marker] at @s run function mhdp_monsters:core/util/other/on_ground
    execute as @e[type=marker,tag=Temp.Move.Target.Marker] at @s run tp @s ~ ~0.8 ~

# 移動ベクトル計算
    scoreboard players set #mhdp_temp_move_tick MhdpCore 18
    function mhdp_monsters:core/util/other/move_to_target_calc
