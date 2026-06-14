#> api:weapon_operation/up_build_gauge.m
#
# 建材ゲージ上昇

# モーション値を加算
    $scoreboard players add @s Ply.Stats.BuildGauge $(UpBuildGauge)
