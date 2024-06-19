#> mhdp_items:player/ui/item/main
#
# UI処理 特殊装具ごとの特殊ゲージ
#

# 初期化
    data modify storage mhdp_core:temp UI.Item0 set value '[{"text":"\\uF889\\uF802","font":"space"}]'
    data modify storage mhdp_core:temp UI.Item1 set value '[{"text":"\\uF889\\uF802","font":"space"}]'

# 特殊装具への処理分岐
    function mhdp_items:core/switch/item/ui

# 不動の装衣
    # execute if entity @s[tag=PlyItmImmovable] run function mhdp_weapons:ui/item/immovable/
# 翔蟲
    # execute if entity @s[tag=PlyItmWirebug] run function mhdp_weapons:ui/item/wirebug/
