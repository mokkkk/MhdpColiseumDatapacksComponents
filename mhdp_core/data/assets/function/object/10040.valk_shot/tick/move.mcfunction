#> assets:object/10040.valk_shot/tick/move
#
# 射撃弾 移動 + 着弾判定（旧 shot/shot/main）
#
# @within function assets:object/10040.valk_shot/tick/

# 演出
    particle dust{color:[1.000,0.000,0.152],scale:2} ^ ^ ^ 0.4 0.4 0.4 0.15 3

# 着弾トリガー（プレイヤー近接 / モンスター HitBox 近接 / ブロック衝突）
    execute if entity @a[tag=Ply.State.EnableDamage,distance=..1.5] run function assets:object/10040.valk_shot/tick/hit
    execute if entity @n[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..1.5] run function assets:object/10040.valk_shot/tick/hit
    execute unless block ^ ^ ^1 #mhdp_core:no_collision run function assets:object/10040.valk_shot/tick/hit

# 前進
    execute if entity @s[tag=!10040.Hit] run tp @s ^ ^ ^1
