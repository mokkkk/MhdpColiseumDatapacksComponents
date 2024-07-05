#> mhdp_monster_ranposu:core/tick/animation/event/step_jump_left/move_start
#
# アニメーションイベントハンドラ 回り込み急襲
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/step_jump_left/main

# 移動対象取得
    tag @n[tag=Mns.Target.Ranposu] add Temp.Move.Target

# ターゲット配置
    summon marker ~ ~ ~ {Tags:["Temp.Move.Target.Marker"]}
    execute positioned as @n[tag=Temp.Move.Target] positioned ^ ^ ^-1 run tp @e[type=marker,tag=Temp.Move.Target.Marker] ~ ~ ~

# 移動ベクトル計算
    scoreboard players set #mhdp_temp_move_tick MhdpCore 14
    function mhdp_monsters:core/util/other/move_to_target_calc

# 終了
    tag @n[tag=Temp.Move.Target] remove Temp.Move.Target
