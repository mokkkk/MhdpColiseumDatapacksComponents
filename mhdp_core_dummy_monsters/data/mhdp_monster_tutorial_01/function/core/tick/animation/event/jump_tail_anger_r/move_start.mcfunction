#> mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/move_start
#
# アニメーションイベントハンドラ 尻尾叩きつけ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 移動対象取得
    tag @n[tag=Mns.Target.Dino] add Temp.Move.Target

# ターゲット配置
    summon marker ~ ~ ~ {Tags:["Temp.Move.Target.Marker"]}
    execute positioned as @n[tag=Temp.Move.Target] positioned ^ ^ ^-9 run tp @e[type=marker,tag=Temp.Move.Target.Marker] ~ ~ ~
    execute as @e[type=marker,tag=Temp.Move.Target.Marker] at @s run function mhdp_monsters:core/util/other/on_ground

# 移動ベクトル計算
    scoreboard players set #mhdp_temp_move_tick MhdpCore 14
    function mhdp_monsters:core/util/other/move_to_target_calc

# 終了
    tag @n[tag=Temp.Move.Target] remove Temp.Move.Target
