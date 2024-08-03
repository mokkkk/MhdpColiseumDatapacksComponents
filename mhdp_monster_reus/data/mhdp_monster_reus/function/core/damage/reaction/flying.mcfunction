#> mhdp_monster_reus:core/damage/reaction/flying
#
# 怯みリアクション 空中
#
# @within function mhdp_monster_reus:core/damage/damage

# 自身の影の位置に合わせる
    function mhdp_monsters:core/util/damage/set_pos_to_shadow

# スタンまたは麻痺時、確実に墜落する
    execute if entity @s[tag=Mns.State.IsStun] run scoreboard players set @s Mns.Reus.Fly.Damage.Count 2
    execute if entity @s[tag=Mns.State.IsParalysis] run scoreboard players set @s Mns.Reus.Fly.Damage.Count 2

# 怯み回数に応じて、怯みまたは墜落アニメーション再生
    scoreboard players add @s Mns.Reus.Fly.Damage.Count 1
    execute if score @s Mns.Reus.Fly.Damage.Count matches ..1 run function animated_java:reus_aj/animations/fly_damage/tween {duration:1, to_frame: 1}
    execute if score @s Mns.Reus.Fly.Damage.Count matches 2.. run function animated_java:reus_aj/animations/fly_damage_down/tween {duration:1, to_frame: 1}
    execute if score @s Mns.Reus.Fly.Damage.Count matches 2.. run scoreboard players set @s Mns.Reus.Fly.Damage.Count 0
