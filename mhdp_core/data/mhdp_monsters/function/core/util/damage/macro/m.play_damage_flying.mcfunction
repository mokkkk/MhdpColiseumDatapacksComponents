#> mhdp_monsters:core/util/damage/macro/m.play_damage_flying
# 
# 汎用処理 空中怯みモーション再生
#
# @within function mhdp_monsters:/**

# 空中怯みモーション再生
    $function animated_java:$(Prefix)_aj/animations/damage_flying/tween {duration:3, to_frame: 0}
