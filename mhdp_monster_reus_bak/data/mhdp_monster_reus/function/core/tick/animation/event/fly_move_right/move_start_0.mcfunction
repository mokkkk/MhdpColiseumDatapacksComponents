#> mhdp_monster_reus:core/tick/animation/event/land_backstep/move_start
#
# アニメーションイベントハンドラ バックステップ
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_backstep/main

# 移動対象取得
    tag @n[tag=Mns.Target.Reus] add Temp.Move.Target

# ターゲット配置
    execute facing entity @n[tag=Mns.Target.Reus] feet rotated ~ 0 run summon marker ^-8 ^-1 ^5 {Tags:["Temp.Move.Target.Marker"]}

# 移動ベクトル計算
    scoreboard players set #mhdp_temp_move_tick MhdpCore 10
    function mhdp_monsters:core/util/other/move_to_target_calc

# 終了
    tag @n[tag=Temp.Move.Target] remove Temp.Move.Target
