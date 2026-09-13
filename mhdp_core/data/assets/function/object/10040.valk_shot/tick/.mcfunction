#> assets:object/10040.valk_shot/tick/
#
# 龍気形態の射撃弾 tick（旧 shot/shot/tick）
#
# @within function assets:core/**

# 経過
    scoreboard players add @s ObjectTick 1

# 移動 + 着弾判定を 1 tick に 2 回（旧 shot/shot/main ×2）
    execute if entity @s[tag=!10040.Hit] at @s run function assets:object/10040.valk_shot/tick/move
    execute if entity @s[tag=!10040.Hit] at @s run function assets:object/10040.valk_shot/tick/move

# 寿命切れ（30 tick で強制着弾）
    execute if entity @s[tag=!10040.Hit] if score @s ObjectTick matches 30.. positioned ~ ~1 ~ run function assets:object/10040.valk_shot/tick/hit
