#> assets:object/10046.valk_bomb/init/
#
# 爆発 VFX 初期化

# 向き固定
    tp @s ~ ~ ~ ~ ~

# スケール上書き（Override.Scale が整数で渡された場合。既定5）
    execute if data storage api: Arg.Override.Scale run function assets:object/10046.valk_bomb/init/apply_scale.m with storage api: Arg.Override
