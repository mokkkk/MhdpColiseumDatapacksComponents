#> assets:object/1000.normal_wall/tick/expand
#
# tick処理

# 拡大
    data modify entity @s transformation.translation set value [0f,1.25f,0f]
    data modify entity @s transformation.scale set value [2.5f,2.5f,2.5f]
    data modify entity @s start_interpolation set value 0

# 演出
    playsound block.shulker_box.open master @a ~ ~ ~ 1 1.6
