#> assets:core/object/build/get_link_target.m
#
# 紐づけ

# 紐づけタグ付与
    $execute as @e[type=$(Type),tag=$(Tag),scores={Build.Uid=$(Uid)}] run tag @s add Asset.Build.Target

# 終了
    data remove storage api: Arg.Uid
