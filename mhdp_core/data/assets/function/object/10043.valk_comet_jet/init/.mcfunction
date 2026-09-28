#> assets:object/10043.valk_comet_jet/init/
#
# 彗星のジェット VFX 初期化

# 向き固定
    tp @s ~ ~ ~ ~ ~

# スケール上書き（Override.Scale が整数で渡された場合。旧値20）
    execute if data storage api: Arg.Override.Scale run function assets:object/10043.valk_comet_jet/init/apply_scale.m with storage api: Arg.Override
