#> assets:core/object/build/start_link
#
# 紐づけ

# Uid取得
    scoreboard players operation @s Build.Uid = @n[type=item_display,tag=Asset.Build.Root,tag=This] Build.Uid

# タグ消去
    tag @s remove Asset.Build.HitBox.Init
    tag @s remove Asset.Build.Display.Init
