#> mhdp_monsters:core/util/tick/macro/m.start_damage_interval
# 
# 汎用処理 同士討ちの無敵時間開始
#
# @within function mhdp_monsters:core/util/tick/start_damage_interval

# 対象のモンスターの当たり判定を無敵化
    $execute as @e[type=slime,tag=Mns.HitBox.$(UpperName)] run tag @s add Mns.HitBox.DisableMnsDamage
