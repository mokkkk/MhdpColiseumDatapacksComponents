#> mhdp_monster_valk:core/damage/reaction/flying
#
# 怯みリアクション 空中
# 天彗龍の墜落怯みアニメは lance_damage_flying。
# 共通 mhdp_monsters:core/util/damage/reaction_flying は animations/damage_flying を要求するため、
# ここでは valk 固有アニメ名で影の位置合わせ + 再生をインラインで行う。
#
# @within function mhdp_monster_valk:core/damage/damage

# 自身の影の位置に合わせる (モデル表示位置と実際の位置を合わせる)
    execute positioned as @e[type=item_display,tag=aj.valk_aj.locator.shadow] run tp @s ~ ~1 ~ ~ 0

# 墜落アニメーション再生
    function animated_java_valk:valk/animations/lance_damage_flying/tween {duration:1, to_frame: 1}

# 飛行状態解除
    tag @s remove Mns.State.IsFlying
