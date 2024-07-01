#> mhdp_monster_ranposu:core/damage/reaction/head
#
# 怯みリアクション 頭
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# TODO:部位破壊・頭
    # ...

# アニメーション再生
    execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function animated_java:ranposu_aj/animations/damage/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monsters:core/util/damage/reaction_flying

# 怯み回数増加
    scoreboard players add @s Mns.Ranposu.DamageCount 1

# 空中怯みの場合のダウン時間設定
    scoreboard players set @s Mns.General.DownCount 2

# 攻撃者を向く
    execute at @s facing entity @a[tag=Temp.Attacker] feet run tp @s ~ ~ ~ ~ 0
    
# 演出
    playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.9
    playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.6
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# 終了
    scoreboard players operation @s Mns.Ranposu.Head.Damage = @s Mns.Ranposu.Head.Damage.Max
