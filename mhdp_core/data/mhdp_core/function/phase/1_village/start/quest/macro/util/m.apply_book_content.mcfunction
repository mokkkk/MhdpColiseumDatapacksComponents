#> mhdp_core:phase/1_village/start/quest/macro/util/m.apply_book_content
#
# 村Phase開始・更新処理 クエスト受注書の更新
#
# @within function mhdp_core:phase/1_village/start/quest/main

# 書見台の適用
    # ダミーの1ページ目を削除
        $data remove block $(X) $(Y) $(Z) Book.components."minecraft:written_book_content".pages[0]
    # resolvedをリセットし、内容を更新
        $data modify block $(X) $(Y) $(Z) Book.components."minecraft:written_book_content".resolved set value 0b
