#> mhdp_monster_ranposu:core/damage/reaction/sp
#
# 怯みリアクション 大怯み
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# TODO:アニメーション再生
    execute if entity @s[tag=!Mns.Temp.IsDamaged]

# 怯み回数リセット
    scoreboard players set @s Mns.Ranposu.DamageCount 0

# 終了
    execute if entity @s[tag=Mns.Temp.Damage.Head] run scoreboard players operation @s Mns.Ranposu.Head.Damage = @s Mns.Ranposu.Head.Damage.Max
    tag @s remove Mns.Temp.Damage.Head
    execute if entity @s[tag=Mns.Temp.Damage.Body] run scoreboard players operation @s Mns.Ranposu.Body.Damage = @s Mns.Ranposu.Body.Damage.Max
    tag @s remove Mns.Temp.Damage.Body
