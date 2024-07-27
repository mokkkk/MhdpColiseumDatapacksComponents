#> mhdp_monster_reus:core/tick/animation/event/fly_damage_tail/move_start
#
# アニメーションイベントハンドラ 飛行中ダウン
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_backstep/main

# 移動対象取得
    tag @n[tag=Mns.Target.Reus] add Temp.Move.Target

# ターゲット配置
    execute rotated ~ 0 run summon marker ^2 ^ ^11 {Tags:["Temp.Move.Target.Marker"]}
    execute as @e[type=marker,tag=Temp.Move.Target.Marker] at @s run function mhdp_monsters:core/util/other/on_ground

# 移動ベクトル計算
    scoreboard players set #mhdp_temp_move_tick MhdpCore 15
    function mhdp_monsters:core/util/other/move_to_target_calc

# 終了
    tag @n[tag=Temp.Move.Target] remove Temp.Move.Target
