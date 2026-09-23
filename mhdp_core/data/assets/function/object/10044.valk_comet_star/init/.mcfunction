#> assets:object/10044.valk_comet_star/init/
#
# 彗星の星 VFX 初期化

# 向き固定
    tp @s ~ ~ ~ ~ ~

# スケール上書き（Override.Scale が整数で渡された場合。X/Y のみ、Z は平面表示のため1固定。未指定時は既定0のまま=呼び出し側で成長させる想定）
    execute if data storage api: Arg.Override.Scale run function assets:object/10044.valk_comet_star/init/apply_scale.m with storage api: Arg.Override
