#> mhdp_core:phase/1_village/start/quest/macro/util/m.reset_book_normal
#
# 村Phase開始・更新処理 クエスト受注書の更新
#
# @within function mhdp_core:phase/1_village/start/quest/main

# 書見台のリセット
    $data modify block $(X) $(Y) $(Z) Book.components."minecraft:written_book_content" set value {"title": "クエスト一覧書","author": "受付嬢コハク","resolved":false,"pages": [{raw:'[{"text":""}]'}]}
