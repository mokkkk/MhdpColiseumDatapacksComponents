#> mhdp_monster_valk:core/tick/animation/event/shoot_moveback/end
#
# アニメーションイベントハンドラ 車庫入れ
#
# @within function mhdp_monster_valk:core/tick/animation/event/shoot_moveback/main

# 変形に移行
    execute if entity @s[tag=Mns.Temp.Valk.MoveToChangePhase] run function mhdp_monster_valk:core/tick/animation/change/play/change_phase

# 行動選択
    function mhdp_monster_valk:core/tick/animation/change/main

# 終了
    tag @s remove Mns.Temp.Valk.MoveToChangePhase
