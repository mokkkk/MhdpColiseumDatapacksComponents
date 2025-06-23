#> api:weapon/error
#
# エラー表示
#
# @input storage api: Arg.Message エラーメッセージ

# エラー表示
    $tellraw @s {"text":"$(Message)","color":"red"}

# 終了
    data remove storage mhdp_core:temp Args
