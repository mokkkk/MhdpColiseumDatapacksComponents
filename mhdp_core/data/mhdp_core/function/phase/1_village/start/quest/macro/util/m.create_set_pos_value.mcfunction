#> mhdp_core:phase/1_village/start/quest/macro/util/m.create_set_pos_value
#
# 村Phase開始・更新処理 クエスト受注書の更新
#
# @within function mhdp_core:phase/1_village/start/quest/main

# Posにクエスト受注書の座標を格納
    $data modify storage mhdp_core:temp Data.Pos set value "$(X) $(Y) $(Z)"
