#> mhdp_core:phase/1_village/start/entity/macro/m.lost_item_chest
#
# 村Phase開始・更新処理 処理に必要なEntityの有無を確認
#
# @within function mhdp_core:phase/1_village/start/entity/main

# クエスト受注書
    $execute unless block $(X) $(Y) $(Z) chest run setblock $(X) $(Y) $(Z) chest[facing=$(Facing),type=right] replace
    $execute positioned $(X) $(Y) $(Z) rotated $(Rotate) 0 positioned ^ ^ ^1 unless block ~ ~ ~ chest run setblock ~ ~ ~ chest[facing=$(Facing),type=left] replace
