#> mhdp_monster_valk:core/damage/reaction/head
#
# 怯みリアクション 頭
#
# @within function mhdp_monster_valk:core/damage/damage

# 共通処理
    # スコアリセット
        scoreboard players operation @s Mns.Valk.Head.Damage = @s Mns.Valk.Head.Damage.Max
    # カウンター増加
        scoreboard players add @s Mns.Valk.Head.Damage.Count 1
        
# 部位破壊処理
    execute if entity @s[tag=!Mns.Break.Head] if score @s Mns.Valk.Head.Damage.Count matches 2.. run function mhdp_monster_valk:core/damage/reaction/head_break

# アニメーション再生処理
    # 麻痺・ダウン・スタン時以外
        execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
    # アニメーション再生
        execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function animated_java:valk_aj/animations/lance_damage_head/tween {duration:1, to_frame: 0}
        execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monster_valk:core/damage/reaction/flying
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 2
    # 状態設定
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_flying.playing] run tag @s add Mns.State.IsDown
        tag @s remove Mns.State.IsDisableAngerSpeed
    # 攻撃者を向く
        execute at @s facing entity @a[tag=Temp.Attacker] feet run tp @s ~ ~ ~ ~ 0
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # アニメーションタグ消去
        function mhdp_monsters:core/util/other/remove_animation_tag
    # モデル変更(天彗龍の一部演出をリセットするため)
        function mhdp_monster_valk:core/util/models/model_interrupt
    # その他
        kill @n[type=text_display,tag=Mns.Shot.Valk.Vfx.RedFlash.Long]