#> debug:check_hate
#
# ヘイト確認
#
# @input storage api: Arg.QuestId 対象クエストID

# ヘイト表示
    $tellraw @a [{"text":" - ヘイト："},{"selector":"@s"},{"text":" / "},{"score":{"name":"@s","objective":"Mns.$(Name).Hate"}}]
