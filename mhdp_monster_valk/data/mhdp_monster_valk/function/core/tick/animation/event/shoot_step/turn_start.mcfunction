#> mhdp_monster_valk:core/tick/animation/event/shoot_step/turn_start
#
# アニメーションイベントハンドラ ステップ 軸合わせ開始
#
# @within function mhdp_monster_valk:core/tick/animation/event/shoot_step/main

# 角度計算（alignment_start.m内部のTemp.Rotate.Target.Markerと衝突するため専用タグへ付け替え）
    tag @n[type=area_effect_cloud,tag=Temp.Rotate.Target.Marker] add Mns.Valk.Step.RotateTarget
    function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Valk.Step.RotateTarget",Tick:11,MaxRotation:360}

# 終了
    tag @e[tag=Mns.Valk.Step.RotateTarget] remove Mns.Valk.Step.RotateTarget
    kill @e[type=area_effect_cloud,tag=Temp.Rotate.Target.Marker]
