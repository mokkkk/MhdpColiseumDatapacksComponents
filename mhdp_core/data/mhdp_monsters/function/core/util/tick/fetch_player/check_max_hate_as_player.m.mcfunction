#> mhdp_monsters:core/util/tick/fetch_player/check_max_hate_as_player.m
# 
# 汎用処理 プレイヤーのヘイト取得
#
# @input arg CandidateTag モンスターの候補タグ
# @input arg TargetTag モンスターのターゲットタグ
# @input arg Score 比較するスコアボード名

# ヘイトを比較、最大値以下の場合は実行しない
    $execute unless score @s $(Score) > #temp_max_hate MhdpCore run return 0

# ターゲットを自身に変更
    $tag @a remove $(TargetTag)
    $tag @s add $(TargetTag)

# ヘイト最大値更新
    $scoreboard players operation #temp_max_hate MhdpCore = @s $(Score)
