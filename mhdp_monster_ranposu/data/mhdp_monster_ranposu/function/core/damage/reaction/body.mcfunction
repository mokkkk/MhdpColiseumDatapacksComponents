#> mhdp_monster_ranposu:core/damage/reaction/body
#
# 怯みリアクション 胴
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# TODO:アニメーション再生
    execute if entity @s[tag=!Mns.Temp.IsDamaged]

# 怯み回数増加
    scoreboard players set @s Mns.Ranposu.DamageCount 1

# 終了
    scoreboard players operation @s Mns.Ranposu.Body.Damage = @s Mns.Ranposu.Body.Damage.Max
