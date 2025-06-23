#> api:debug/set_debug_flag.m
#
# デバッグ用処理、デバッグメッセージの表示有無切り替え
#
# @input storage api: Arg.Value 値

# メモ
    # function api:debug/set_debug_flag.m {Value:"true"}
    # execute if data storage mhdp_core:game_data {ShowDebugMessage:true} 

# 状態更新
    $data modify storage mhdp_core:game_data ShowDebugMessage set value $(Value)

# 終了
    data remove storage api: Arg
