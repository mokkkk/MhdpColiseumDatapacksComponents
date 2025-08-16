#> api:weapon_operation/charge_arts.m
#
# 狩技ゲージ上昇

# モーション値を加算
    $execute unless entity @s[tag=Ply.Weapon.UsingArts.1] run scoreboard players add @s Ply.Stats.Arts.1 $(DamageMult)
    $execute unless entity @s[tag=Ply.Weapon.UsingArts.2] run scoreboard players add @s Ply.Stats.Arts.2 $(DamageMult)

# 上限は超えない
    execute if score @s Ply.Stats.Arts.1 > @s Ply.Stats.Arts.1.Max run scoreboard players operation @s Ply.Stats.Arts.1 = @s Ply.Stats.Arts.1.Max
    execute if score @s Ply.Stats.Arts.2 > @s Ply.Stats.Arts.2.Max run scoreboard players operation @s Ply.Stats.Arts.2 = @s Ply.Stats.Arts.2.Max
