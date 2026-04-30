#> mhdp_core:phase/3_quest/map/coliseum/ring_bell
#
# クエスト中のtick処理 大闘技場
#
# @within function mhdp_core:phase/3_quest/tick

tellraw @a {text:"【ERROR】 旧バージョンのフィールドtick処理が呼び出されています",color:"red"}

# ベルを鳴らす
    setblock 216 65 147 redstone_torch

# レッドストーンブロックの除去
    schedule function mhdp_core:phase/3_quest/map/coliseum/remove_redstone 1t append
