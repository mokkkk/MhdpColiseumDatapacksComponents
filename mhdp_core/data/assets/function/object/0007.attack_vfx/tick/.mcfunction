#> assets:object/0007.attack_vfx/tick/
#
# 攻撃Vfxのtick処理
#
# @within function mhdp_items:/**

# スコア増加
    execute store result storage mhdp_core:temp Temp.Vfx.String int 1 run scoreboard players add @s ObjectTick 1

# フォント指定
    function assets:object/0007.attack_vfx/tick/select_font

# 文字更新
    function assets:object/0007.attack_vfx/tick/update_text.m with storage mhdp_core:temp Temp.Vfx

# 終了
    data remove storage mhdp_core:temp Temp.Vfx
    execute if score @s ObjectTick matches 10.. run kill @s
