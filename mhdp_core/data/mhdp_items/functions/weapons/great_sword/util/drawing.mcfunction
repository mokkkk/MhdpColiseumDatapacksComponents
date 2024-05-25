#> mhdp_items:weapons/great_sword/util/drawing
#
# 武器の抜刀時処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# TODO: 武器の初期化処理
    say TODO:大剣抜刀処理

# ステータス設定
    attribute @s generic.attack_speed modifier add f-f-f-a-1 "武器の個別攻撃速度" -3.0 add_value
    attribute @s generic.movement_speed modifier add f-f-f-a-2 "武器の個別移動速度" -0.05 add_value
    attribute @s generic.attack_damage modifier remove f-f-f-a-4
    attribute @s generic.attack_damage modifier add f-f-f-a-4 "武器の個別攻撃力" 5.0 add_value
