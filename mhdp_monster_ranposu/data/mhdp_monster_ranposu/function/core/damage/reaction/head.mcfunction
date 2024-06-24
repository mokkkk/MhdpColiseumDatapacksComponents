#> mhdp_monster_ranposu:core/damage/reaction/head
#
# 怯みリアクション 頭
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# TODO:部位破壊・頭
    # ...

# TODO:アニメーション再生
    execute if entity @s[tag=!Mns.Temp.IsDamaged]

# 怯み回数増加
    scoreboard players set @s Mns.Ranposu.DamageCount 1

# 終了
    scoreboard players operation @s Mns.Ranposu.Head.Damage = @s Mns.Ranposu.Head.Damage.Max
