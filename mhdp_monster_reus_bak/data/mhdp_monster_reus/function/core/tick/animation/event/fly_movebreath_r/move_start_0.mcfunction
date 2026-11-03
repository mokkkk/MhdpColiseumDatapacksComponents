#> mhdp_monster_reus:core/tick/animation/event/fly_movebreath_r/move_start_0
#
# アニメーションイベントハンドラ 飛行ブレス
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_backstep/main

# 移動対象取得
    tag @n[tag=Mns.Target.Reus] add Temp.Move.Target

# ターゲット配置
    summon marker ^ ^ ^12 {Tags:["Temp.Move.Target.Marker"]}
    execute rotated ~ 0 positioned as @n[tag=Temp.Move.Target] positioned ^-5 ^ ^9 as @n[type=marker,tag=Temp.Move.Target.Marker] run tp @s ~ ~2 ~

# 移動ベクトル計算
    scoreboard players set #mhdp_temp_move_tick MhdpCore 35
    function mhdp_monsters:core/util/other/move_to_target_calc

# 終了
    tag @n[tag=Temp.Move.Target] remove Temp.Move.Target
