#> mhdp_monster_dino:core/util/phase/tail_heat
#
# 尻尾の加熱
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# カウント増加
    scoreboard players add @s Mns.Dino.PhaseCount.Tail 1

# フェーズ変更
    execute if entity @s[tag=!Mns.Dino.State.TailHeat,tag=!Mns.Dino.State.TailRust] if score @s Mns.Dino.PhaseCount.Tail matches 5.. run function mhdp_monster_dino:core/util/models/heat_start
