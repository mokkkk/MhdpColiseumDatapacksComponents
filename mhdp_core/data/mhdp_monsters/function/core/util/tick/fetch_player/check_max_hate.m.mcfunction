#> mhdp_monsters:core/util/tick/fetch_player/check_max_hate.m
# 
# 汎用処理 プレイヤーのヘイト取得
# ヘイトが最も高いプレイヤーに対し、
#
# @input arg CandidateTag モンスターの候補タグ
# @input arg TargetTag モンスターのターゲットタグ
# @input arg Score 比較するスコアボード名

# 初期化
    scoreboard players set #temp_max_hate MhdpCore 0

# 実行
    $execute as @a[tag=$(CandidateTag)] run function mhdp_monsters:core/util/tick/fetch_player/check_max_hate_as_player.m {CandidateTag:"$(CandidateTag)",TargetTag:"$(TargetTag)",Score:"$(Score)"}

# 終了
    scoreboard players reset #temp_max_hate MhdpCore
