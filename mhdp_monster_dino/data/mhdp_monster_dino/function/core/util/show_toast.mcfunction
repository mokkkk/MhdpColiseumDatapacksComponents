#> mhdp_monster_ranposu:core/util/show_toast
#
# 部位破壊トーストを表示する
#
# @within function mhdp_monster_ranposu:core/damage/reaction/**

# 部位破壊トースト表示
    advancement grant @a[tag=Ply.State.PlayingQuest] only mhdp_monster_ranposu:toast_break

# 一定時間後に剥奪
    schedule function mhdp_monster_ranposu:core/util/hide_toast 5t replace
