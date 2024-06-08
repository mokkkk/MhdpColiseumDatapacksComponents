#> mhdp_items:weapons/great_sword/util/sheathe
#
# 武器の納刀時処理
#
# @within function mhdp_items:core/switch/macro/m.sheathe

# 割り込み処理
    function mhdp_items:weapons/great_sword/util/interrupt

# ステータス削除(割り込み処理の上書き)
    attribute @s generic.attack_damage modifier remove f-f-f-a-4
