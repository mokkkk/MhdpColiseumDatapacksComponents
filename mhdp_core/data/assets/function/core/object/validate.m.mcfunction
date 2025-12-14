#> assets:core/object/validate.m
#
# 建造物のvalidate処理
#
# @within function mhdp_core:tick

# validate処理実行
    tag @s add This
    $function assets:object/alias/$(ObjectId)/validate
    tag @s remove This
