#> mhdp_monsters:core/util/damage/reaction_poison
# 
# 汎用処理 毒効果発動
#
# @within function mhdp_monsters:/**

# 耐性値増加
    scoreboard players operation @s Mns.Poison.Damage.Max *= #const_poison_damage_multiply Const
    execute store result score @s Mns.Poison.Damage run scoreboard players operation @s Mns.Poison.Damage.Max /= #const_100 Const

# タイマー設定
    scoreboard players operation @s Mns.Poison.Timer = @s Mns.Poison.Timer.Max
    scoreboard players set @s Mns.Poison.Timer.Sub 0

# 効果発動
    tag @s add Mns.State.IsPoison
