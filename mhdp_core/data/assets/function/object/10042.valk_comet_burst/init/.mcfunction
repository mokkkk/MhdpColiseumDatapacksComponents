#> assets:object/10042.valk_comet_burst/init/
#
# 彗星の炸裂 VFX 初期化

# 向き固定
    tp @s ~ ~ ~ ~ ~

# スケール上書き（Override.Scale が整数で渡された場合。X/Y のみ、Z は平面表示のため1固定。旧値200）
    execute if data storage api: Arg.Override.Scale run function assets:object/10042.valk_comet_burst/init/apply_scale.m with storage api: Arg.Override
