#> mhdp_monster_reus:core/damage/reaction/flying
#
# 怯みリアクション 空中
#
# @within function mhdp_monster_reus:core/damage/damage

# 自身の影の位置に合わせる
    function mhdp_monsters:core/util/damage/set_pos_to_shadow

# 怯み回数に応じて、怯みまたは墜落アニメーション再生
    function animated_java:reus_aj/animations/fly_damage_down/tween {duration:1, to_frame: 1}
