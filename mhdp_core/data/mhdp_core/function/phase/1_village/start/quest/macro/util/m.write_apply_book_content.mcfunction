#> mhdp_core:phase/1_village/start/quest/macro/util/m.write_apply_book_content
#
# 村Phase開始・更新処理 クエスト受注書の更新
#
# @within function mhdp_core:phase/1_village/start/quest/main

# クエスト受注書の内容更新
    $data modify block $(X) $(Y) $(Z) Book.components."minecraft:written_book_content".resolved set value 0b
