#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle_repeat/move_start
#
# アニメーションイベントハンドラ 滑空突進折り返し
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_repeat/main


# ターゲット配置
    summon marker ^ ^ ^14 {Tags:["Temp.Move.Target.Marker"]}
    execute as @e[type=marker,tag=Temp.Move.Target.Marker] at @s run function mhdp_monsters:core/util/other/on_ground

# 移動ベクトル計算
    scoreboard players set #mhdp_temp_move_tick MhdpCore 12
    function mhdp_monsters:core/util/other/move_to_target_calc

# 終了
    tag @n[tag=Temp.Move.Target] remove Temp.Move.Target
