#> mhdp_monster_valk:core/tick/animation/event/comet_phase_3/move_start
#
# アニメーションイベントハンドラ 彗星・急襲
#
# @within function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/main


# ターゲット配置
    execute positioned as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] run summon marker ^ ^ ^ {Tags:["Temp.Move.Target.Marker"]}
    execute as @e[type=marker,tag=Temp.Move.Target.Marker] at @s run function mhdp_monsters:core/util/other/on_ground

# 移動ベクトル計算
    scoreboard players set #mhdp_temp_move_tick MhdpCore 18
    function mhdp_monsters:core/util/other/move_to_target_calc

# 終了
    tag @n[tag=Temp.Move.Target] remove Temp.Move.Target
