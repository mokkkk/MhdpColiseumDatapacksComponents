#> assets:object/0009.floating_text/init/apply.m
#
# オブジェクト初期化処理

# Height設定
    $data modify entity @s transformation.translation set value [0f,$(Height)f,0f]

# Scale設定
    $data modify entity @s transformation.scale set value [$(Scale)f,$(Scale)f,$(Scale)f]

# 文字表示
    $data modify entity @s text set value [{"text":"$(Text)","font":"vfx/reaction"}]

# 独自タグ設定
    $tag @s add 9.$(Tag)
