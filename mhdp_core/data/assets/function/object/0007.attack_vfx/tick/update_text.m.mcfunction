#> assets:object/0007.attack_vfx/tick/update_text.m
#
# 攻撃Vfxのtick処理
#
# @within function mhdp_items:/**

# フォント指定
    $data modify entity @s text set value {"text":"$(String)","font":"vfx/$(Font)"}
