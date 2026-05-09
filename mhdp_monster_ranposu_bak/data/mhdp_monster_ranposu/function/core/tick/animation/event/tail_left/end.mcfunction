#> mhdp_monster_ranposu:core/tick/animation/event/tail_left/end
#
# アニメーションイベントハンドラ 尻尾攻撃
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# カウンター増加
    scoreboard players add @s Mns.Ranposu.TailCount 1

# 2回まで繰り返す
    execute if score @s Mns.Ranposu.TailCount matches ..1 run tag @s add Anim.Tail.L
    execute if score @s Mns.Ranposu.TailCount matches ..1 run tag @s add Mns.Temp.IsCombo

# 行動選択
    function mhdp_monster_ranposu:core/tick/animation/change/main
