#> mhdp_monsters:core/util/damage/macro/m.set_pos_to_shadow
# 
# 汎用処理 影の位置に移動
#
# @within function mhdp_monsters:/**

# 移動
    $execute positioned as @e[type=minecraft:item_display,tag=aj.$(Prefix)_aj.locator.shadow] run tp @s ~ ~1 ~ ~ 0

# 空中怯みモーション再生
    $function animated_java:$(Prefix)_aj/animations/damage_flying/tween {duration:3, to_frame: 0}
