#> mhdp_core:phase/1_village/start/entity/macro/m.lectern
#
# 村Phase開始・更新処理 処理に必要なEntityの有無を確認
#
# @within function mhdp_core:phase/1_village/start/entity/main

# クエスト受注書
    $execute unless block $(X) $(Y) $(Z) lectern run setblock $(X) $(Y) $(Z) lectern[facing=$(Facing),has_book=true] replace
