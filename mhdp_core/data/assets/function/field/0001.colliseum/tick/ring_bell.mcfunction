#> assets:field/0001.colliseum/tick/ring_bell
#
# フィールドtick処理 クエストリタイアベルクリック時

# ベルを鳴らす
    setblock 216 65 147 redstone_torch

# レッドストーントーチの除去
    schedule function mhdp_core:phase/3_quest/map/coliseum/remove_redstone 1t append
