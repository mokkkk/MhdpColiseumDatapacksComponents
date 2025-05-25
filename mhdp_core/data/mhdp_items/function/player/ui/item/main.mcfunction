#> mhdp_items:player/ui/item/main
#
# UI処理 特殊装具ごとの特殊ゲージ
#

# 初期化
    data modify storage mhdp_core:temp UI.ItemTemp set value []
    data modify storage mhdp_core:temp UI.Item0 set value [{"text":"\uF889\uF802","font":"space"}]
    data modify storage mhdp_core:temp UI.Item1 set value [{"text":"\uF889\uF802","font":"space"}]

# 特殊装具への処理分岐
    function mhdp_items:core/switch/item/ui

# 描画
    execute if data storage mhdp_core:temp UI.ItemTemp[0] run data modify storage mhdp_core:temp UI.Item0 set from storage mhdp_core:temp UI.ItemTemp[0]
    execute if data storage mhdp_core:temp UI.ItemTemp[1] run data modify storage mhdp_core:temp UI.Item1 set from storage mhdp_core:temp UI.ItemTemp[1]
