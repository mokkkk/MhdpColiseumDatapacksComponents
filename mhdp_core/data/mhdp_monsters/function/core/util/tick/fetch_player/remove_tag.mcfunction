#> mhdp_monsters:core/util/tick/fetch_player/remove_tag
# 
# 汎用処理 プレイヤーの状態取得
#
# @within function mhdp_monsters:core/util/tick/tick

# タグ消去
    tag @a remove Mns.Temp.Situation.Forward
    tag @a remove Mns.Temp.Situation.Side
    tag @a remove Mns.Temp.Situation.Back
    tag @a remove Mns.Temp.Situation.Near
    tag @a remove Mns.Temp.Situation.Middle
    tag @a remove Mns.Temp.Situation.Far
