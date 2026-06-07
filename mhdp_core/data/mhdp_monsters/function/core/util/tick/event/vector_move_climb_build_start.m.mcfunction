#> mhdp_monsters:core/util/tick/event/vector_move_climb_build_start.m
# 
# 汎用処理 移動開始 建造物の上に乗る
#
# @input arg TargetType 対象のEntityType
# @input arg TargetTag 対象のタグ
# @input arg MaxDistance 距離閾値。Distanceより対象が遠い場合、Distance距離を移動する
# @input arg Tick 移動にかける時間
# @input arg OffsetX 移動位置のオフセット。移動するモンスター基準
# @input arg OffsetZ 移動位置のオフセット。移動するモンスター基準

# バグ対策の初期値
    scoreboard players set @s Mns.Temp.MoveVec.X 0
    scoreboard players set @s Mns.Temp.MoveVec.Y 0
    scoreboard players set @s Mns.Temp.MoveVec.Z 0

# 移動対象がいない場合、処理中断
    $execute unless entity @n[type=$(TargetType),tag=$(TargetTag)] run return 0

# データ保持
    $data modify storage mhdp_core:temp Temp.TargetType set value "$(TargetType)"
    $data modify storage mhdp_core:temp Temp.TargetTag set value "$(TargetTag)"
    $data modify storage mhdp_core:temp Temp.MaxDistance set value $(MaxDistance)
    $data modify storage mhdp_core:temp Temp.Tick set value $(Tick)
    $data modify storage mhdp_core:temp Temp.OffsetX set value $(OffsetX)
    $data modify storage mhdp_core:temp Temp.OffsetZ set value $(OffsetZ)

# OffsetYの取得
    $execute store result storage mhdp_core:temp Temp.OffsetY double 1 run scoreboard players get @n[type=$(TargetType),tag=$(TargetTag)] Build.Stats.Height

# 汎用移動処理の実行
    function mhdp_monsters:core/util/tick/event/vector_move_start.m with storage mhdp_core:temp Temp
