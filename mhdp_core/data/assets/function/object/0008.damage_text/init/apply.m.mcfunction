#> assets:object/0008.damage_text/init/apply.m
#
# オブジェクト初期化処理

# Scale設定
    $data modify entity @s transformation.scale set value [$(Scale)f,$(Scale)f,$(Scale)f]

# ダメージ数値表示
    $data modify entity @s text set value [{"text":"$(Prefix)","color":"white","font":"ui/damage"},{"text":"$(Damage)","color":"$(Color)","font":"ui/damage"}]
