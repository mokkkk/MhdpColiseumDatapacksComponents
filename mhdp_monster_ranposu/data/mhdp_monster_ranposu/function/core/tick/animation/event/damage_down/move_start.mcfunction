#> mhdp_monster_ranposu:core/tick/animation/event/damage_down/move_start
#
# アニメーションイベントハンドラ 大怯み
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 移動対象取得
    tag @n[tag=Mns.Target.Ranposu] add Temp.Move.Target

# ターゲット配置
    summon marker ^ ^ ^-8 {Tags:["Temp.Move.Target.Marker"]}
    execute as @e[type=marker,tag=Temp.Move.Target.Marker] at @s run function mhdp_monsters:core/util/other/on_ground

# 移動ベクトル計算
    scoreboard players set #mhdp_temp_move_tick MhdpCore 16
    function mhdp_monsters:core/util/other/move_to_target_calc

# 終了
    tag @n[tag=Temp.Move.Target] remove Temp.Move.Target
