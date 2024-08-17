#> mhdp_monster_dino:core/damage/reaction/flying
#
# 怯みリアクション 空中
#
# @within function mhdp_monster_dino:core/damage/damage

# 自身の影の位置に合わせる
    function mhdp_monsters:core/util/damage/set_pos_to_shadow

# 墜落アニメーション再生
    function animated_java:dino_aj/animations/damage_flying/tween {duration:1, to_frame: 1}
