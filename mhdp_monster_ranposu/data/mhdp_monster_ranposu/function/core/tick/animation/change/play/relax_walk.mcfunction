#> mhdp_monster_ranposu:core/tick/animation/change/play/relax_walk
#
# アニメーション変更処理 軸合わせ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 歩数決定
    execute store result score @s Mns.General.WalkCount run random value 3..5

# 回転角度決定
    execute store result score @s Mns.Temp.RotateValue run random value -15..15
    # エリア中心から遠い場合、Uターン
        function mhdp_monsters:core/util/other/walk_turn_to_center.m with storage mhdp_core:temp MonsterTemp.CurrentArea

# 再生アニメーション決定
    tag @s add Anim.Walk
