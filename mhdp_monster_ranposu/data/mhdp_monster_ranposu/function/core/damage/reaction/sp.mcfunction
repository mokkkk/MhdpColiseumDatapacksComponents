#> mhdp_monster_ranposu:core/damage/reaction/sp
#
# 怯みリアクション 大怯み
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 共通処理
    # 怯み回数増加
        scoreboard players add @s Mns.Ranposu.DamageCount 1
    # スコアリセット
        execute if entity @s[tag=Mns.Temp.Damage.Head] run scoreboard players operation @s Mns.Ranposu.Head.Damage = @s Mns.Ranposu.Head.Damage.Max
        tag @s remove Mns.Temp.Damage.Head
        execute if entity @s[tag=Mns.Temp.Damage.Body] run scoreboard players operation @s Mns.Ranposu.Body.Damage = @s Mns.Ranposu.Body.Damage.Max
        tag @s remove Mns.Temp.Damage.Body

# アニメーション再生処理
    # 麻痺・ダウン・スタン時以外
        execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
    # アニメーション再生
        function animated_java:ranposu_aj/animations/damage_down/tween {duration:1, to_frame: 0}
    # 怯み回数リセット
        scoreboard players set @s Mns.Ranposu.DamageCount 0
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 4
    # 攻撃者を向く
        execute at @s facing entity @a[tag=Temp.Attacker] feet run tp @s ~ ~ ~ ~ 0
    # 演出
        playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.9
        playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.6
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # 状態設定
        tag @s add Mns.State.IsDown
