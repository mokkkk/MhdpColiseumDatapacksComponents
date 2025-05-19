#> mhdp_items:player/ui/weapon/main
#
# UI表示処理等 武器関連
#

# 初期化
    data modify storage mhdp_core:temp UI.Weapon set value [{"text":"\uF888\uF888\uF888\uF888\uF888\uF888\uF802","font":"space"}]

# 各武器のUI処理への分岐
    function mhdp_items:core/switch/weapon_ui
