#> assets:object/0011.spirit_release_slash/tick/vfx
#
# 練気解放無双斬りの召喚処理
#
# @within function assets:object/0011.spirit_release_slash/tick/

# X乱数
    execute store result storage mhdp_core:temp Temp.VfxRandomX double 0.01 run random value -300..300
# Y乱数
    execute store result storage mhdp_core:temp Temp.VfxRandomY double 0.01 run random value -100..250
# Z乱数
    execute store result storage mhdp_core:temp Temp.VfxRandomZ double 0.01 run random value -200..200
# 角度乱数
    execute store result storage mhdp_core:temp Temp.VfxRandomRotation double 0.01 run random value 60..230
    execute if predicate {"condition":"minecraft:random_chance","chance":0.5} store result storage mhdp_core:temp Temp.VfxRandomRotation double -0.01 run random value 60..230
# 長さ乱数
    execute store result storage mhdp_core:temp Temp.VfxRandomLength float 0.1 run random value 80..150
# 実行
    function assets:object/0011.spirit_release_slash/tick/vfx.m with storage mhdp_core:temp Temp


# 終了
    data remove storage mhdp_core:temp Temp
