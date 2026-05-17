#> mhdp_monsters:core/util/tick/animation/remove_tag
# 
# 汎用処理 プレイヤーの状態取得
#
# @input arg Tag セレクターに使用するTargetタグ
# @input arg DistNear 近距離判定のDistance
# @input arg DistFar 遠距離判定のDistance

# 終了
    tag @a remove Mns.Temp.Situation.IsForward
    tag @a remove Mns.Temp.Situation.IsBack
