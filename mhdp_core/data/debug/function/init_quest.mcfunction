#> debug:init_quest
#
# 対象クエストの強制クリア
#
# @input storage api: Arg.QuestId 対象クエストID

# ベータ版フラグ有効の場合、フラグをリセット
    execute if data storage mhdp_core:game_data {IsBetaVersion:true} run function mhdp_core:beta/reset_flag

# クエスト初期化 + チュートリアルクリア
    function assets:quest/register_quest
    function debug:clear_quest.m {QuestId:1}
