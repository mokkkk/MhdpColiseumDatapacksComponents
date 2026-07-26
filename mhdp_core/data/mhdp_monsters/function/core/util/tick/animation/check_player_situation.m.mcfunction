#> mhdp_monsters:core/util/tick/animation/check_player_situation.m
# 
# 汎用処理 プレイヤーの状態取得
#
# @input arg Tag セレクターに使用するTargetタグ
# @input arg DistNear 近距離判定のDistance
# @input arg DistFar 遠距離判定のDistance

# 位置取り
    # 前方
        $execute rotated ~ 0 run function api:bounding/cake.m {Selector:"@a[tag=$(Tag)]",Tag:"Mns.Temp.Situation.IsForward",Radius:80.0,Height:4.0,Angle:45}
    # 後方
        $execute rotated ~180 0 run function api:bounding/cake.m {Selector:"@a[tag=$(Tag)]",Tag:"Mns.Temp.Situation.IsBack",Radius:80.0,Height:4.0,Angle:45}
