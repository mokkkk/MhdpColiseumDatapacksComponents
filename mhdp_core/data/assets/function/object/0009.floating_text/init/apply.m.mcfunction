#> assets:object/0009.floating_text/init/apply.m
#
# オブジェクト初期化処理

# Scale設定
    $data modify entity @s transformation.scale set value [$(Scale)f,$(Scale)f,$(Scale)f]

# 文字表示
    $data modify entity @s text set value [{"text":"$(Text)","color":"$(Color)"}]
