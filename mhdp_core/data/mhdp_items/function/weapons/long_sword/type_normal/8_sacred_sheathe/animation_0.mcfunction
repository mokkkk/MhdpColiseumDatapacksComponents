#> mhdp_items:weapons/lance/type_tec/20_special_sheathe/animation_0
#
# 縦斬り アニメーション処理
#
# @within function mhdp_items:weapons/lance/type_tec/20_special_sheathe/main

# アニメーション
    function api:weapon/animation.m {Slot:"mainhand", Cmd:"special_sheathe_start_0"}
    function api:weapon/animation.m {Slot:"offhand", Cmd:"empty_sub"}
