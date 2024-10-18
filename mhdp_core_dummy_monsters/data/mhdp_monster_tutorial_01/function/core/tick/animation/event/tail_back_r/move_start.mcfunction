#> mhdp_monster_dino:core/tick/animation/event/tail_back_r/move_start
#
# アニメーションイベントハンドラ 尻尾攻撃・飛びかかり
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# ターゲット配置
    summon marker ^ ^ ^6 {Tags:["Temp.Move.Target.Marker"]}
    execute as @e[type=marker,tag=Temp.Move.Target.Marker] at @s run function mhdp_monsters:core/util/other/on_ground

# 移動ベクトル計算
    scoreboard players set #mhdp_temp_move_tick MhdpCore 10
    function mhdp_monsters:core/util/other/move_to_target_calc
