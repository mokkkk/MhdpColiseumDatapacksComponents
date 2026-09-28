#> assets:object/10041.valk_comet/init/
#
# 彗星フラッシュ VFX 初期化

# 向き固定
    tp @s ~ ~ ~ ~ ~

# スケール上書き（Override.Scale が整数で渡された場合。X/Y のみ、Z は平面表示のため1固定。旧値164）
    execute if data storage api: Arg.Override.Scale run function assets:object/10041.valk_comet/init/apply_scale.m with storage api: Arg.Override
