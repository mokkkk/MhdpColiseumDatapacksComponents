#> mhdp_monster_dino:core/util/phase/tail_polish_check
#
# 尻尾研ぎ
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# カウント増加
    scoreboard players add @s Mns.Dino.PhaseCount.Tail 1

# フェーズ変更
    execute if entity @s[tag=Mns.Dino.State.TailRust] if score @s Mns.Dino.PhaseCount.Tail matches 20.. if predicate {"condition":"minecraft:random_chance","chance":0.4} run function mhdp_monster_dino:core/util/phase/tail_polish_start
