#> mhdp_monster_valk:core/tick/animation/event/lance_death_flying/move_start
#
# アニメーションイベントハンドラ 討伐
#
# @within function mhdp_monster_dino:core/tick/animation/event/lance_death_flying/main

# ターゲット配置
    summon marker ^ ^ ^ {Tags:["Temp.Move.Target.Marker"]}
    execute as @e[type=marker,tag=Temp.Move.Target.Marker] at @s run function mhdp_monsters:core/util/other/on_ground

# 移動ベクトル計算
    scoreboard players set #mhdp_temp_move_tick MhdpCore 6
    function mhdp_monsters:core/util/other/move_to_target_calc

# 終了
    tag @n[tag=Temp.Move.Target] remove Temp.Move.Target
