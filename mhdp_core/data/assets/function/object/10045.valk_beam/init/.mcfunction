#> assets:object/10045.valk_beam/init/
#
# 龍閃ビーム VFX 初期化

# 向き固定
    tp @s ~ ~ ~ ~ ~

# スケール上書き（Override.Scale が整数で渡された場合。旧 lance_biim_2 は 8）
    execute if data storage api: Arg.Override.Scale run function assets:object/10045.valk_beam/init/apply_scale.m with storage api: Arg.Override
