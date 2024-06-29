#> mhdp_monsters:core/util/tick/macro/m.end_damage_interval
# 
# 汎用処理 同士討ちの無敵時間終了
#
# @within function mhdp_monsters:core/util/tick/end_damage_interval

# 対象のモンスターの当たり判定を無敵化
    $execute as @e[type=slime,tag=Mns.HitBox.$(UpperName)] run tag @s remove Mns.HitBox.DisableMnsDamage
