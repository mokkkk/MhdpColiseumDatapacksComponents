#> mhdp_monster_dino:core/util/phase/head_heat
#
# 喉赤熱化から通常に戻るまで
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# カウント減少
    scoreboard players remove @s Mns.Dino.PhaseCount.Head 1

# フェーズ変更
    execute if entity @s[tag=Mns.Dino.State.HeadHeat] if score @s Mns.Dino.PhaseCount.Head matches ..0 run function mhdp_monster_dino:core/util/models/charge_end
