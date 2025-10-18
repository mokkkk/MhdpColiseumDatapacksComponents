#> assets:object/0007.attack_vfx/init/apply.m
#
# オブジェクト初期化処理

# タグ付与
    $tag @s add $(Tag)

# Scale設定
    execute unless entity @s[tag=7.IsCounter] run data modify entity @s transformation.scale set from storage api: Arg.Override.Scale
    execute if entity @s[tag=7.IsCounter] run data modify entity @s transformation.scale set value [20f,20f,20f]

# Rotation設定
    $data modify entity @s transformation.left_rotation set value {axis:[0f,0f,1f],angle:$(Rotation)}

# 1文字目表示
    $data modify entity @s text set value {"text":"0","font":"vfx/$(Tag)"}
