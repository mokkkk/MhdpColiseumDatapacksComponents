#> mhdp_monster_dino:core/util/phase/tail_rust
#
# 尻尾の風化
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# カウント増加
    scoreboard players add @s Mns.Dino.PhaseCount.Tail 1

# フェーズ変更
    execute if entity @s[tag=!Mns.Dino.State.TailRust] if score @s Mns.Dino.PhaseCount.Tail matches 30.. run function mhdp_monster_dino:core/util/models/rust_start
