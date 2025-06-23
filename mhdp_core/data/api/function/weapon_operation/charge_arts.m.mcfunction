#> api:weapon_operation/charge_arts.m
#
# 狩技ゲージ上昇

# モーション値を加算
    $scoreboard players add @s Ply.Stats.Arts.1 $(DamageMult)
    $scoreboard players add @s Ply.Stats.Arts.2 $(DamageMult)

# 上限は超えない
    execute if score @s Ply.Stats.Arts.1 > @s Ply.Stats.Arts.1.Max run scoreboard players operation @s Ply.Stats.Arts.1 = @s Ply.Stats.Arts.1.Max
    execute if score @s Ply.Stats.Arts.2 > @s Ply.Stats.Arts.2.Max run scoreboard players operation @s Ply.Stats.Arts.2 = @s Ply.Stats.Arts.2.Max

# 割合取得
    scoreboard players operation @s Ply.Stats.Arts.1.Percent = @s Ply.Stats.Arts.1
    scoreboard players operation @s Ply.Stats.Arts.1.Percent *= #const_100 Const
    scoreboard players operation @s Ply.Stats.Arts.1.Percent /= @s Ply.Stats.Arts.1.Max
    scoreboard players operation @s Ply.Stats.Arts.1.Percent *= #const_6 Const
    scoreboard players operation @s Ply.Stats.Arts.2.Percent = @s Ply.Stats.Arts.2
    scoreboard players operation @s Ply.Stats.Arts.2.Percent *= #const_100 Const
    scoreboard players operation @s Ply.Stats.Arts.2.Percent /= @s Ply.Stats.Arts.2.Max
    scoreboard players operation @s Ply.Stats.Arts.2.Percent *= #const_6 Const
