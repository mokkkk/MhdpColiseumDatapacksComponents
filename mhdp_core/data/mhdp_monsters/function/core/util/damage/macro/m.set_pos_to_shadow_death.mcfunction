#> mhdp_monsters:core/util/damage/macro/m.set_pos_to_shadow_death
# 
# 汎用処理 影の位置に移動
#
# @within function mhdp_monsters:core/util/damage/death_flying

# 移動
    $execute positioned as @e[type=minecraft:item_display,tag=aj.$(Prefix)_aj.locator.shadow] run tp @s ~ ~1 ~ ~ 0

# 空中討伐モーション再生
    $function animated_java:$(Prefix)_aj/animations/death_flying/tween {duration:3, to_frame: 0}
