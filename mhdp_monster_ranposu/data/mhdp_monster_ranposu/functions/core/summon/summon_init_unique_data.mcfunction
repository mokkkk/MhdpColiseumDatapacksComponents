#> mhdp_monster_ranposu:core/summon/summon_init_unique_data
#
# データ初期化処理を行う 独自データの初期化
#
# @within function mhdp_monster_ranposu:core/summon/summon_init

# 当たり判定
    # タグ付与
        execute on passengers if entity @s[type=snowball,tag=aj.ranposu_aj.locator_origin] on origin if entity @s[type=slime] run tag @s add Mns.HitBox
        execute on passengers if entity @s[type=snowball,tag=aj.ranposu_aj.locator_origin] on origin if entity @s[type=slime] run tag @s add Mns.HitBox.Ranposu
        execute on passengers if entity @s[type=snowball,tag=aj.ranposu_aj.locator_origin.head_0] on origin if entity @s[type=slime] run tag @s add Mns.HitBox.Ranposu.Head
        execute on passengers if entity @s[type=snowball,tag=aj.ranposu_aj.locator_origin] on origin if entity @s[type=slime,tag=!Mns.HitBox.Ranposu.Head] run tag @s add Mns.HitBox.Ranposu.Body
    # UID付与
        scoreboard players operation #mhdp_temp_monster_uid Mns.Uid = @s Mns.Uid
        execute on passengers if entity @s[type=snowball,tag=aj.ranposu_aj.locator_origin] on origin if entity @s[type=slime] run scoreboard players operation @s Mns.HitBox.MonsterUid = #mhdp_temp_monster_uid Mns.Uid
        scoreboard players reset #mhdp_temp_monster_uid Mns.Uid
    # 部位ID付与
        execute on passengers if entity @s[type=snowball,tag=aj.ranposu_aj.locator_origin] on origin if entity @s[type=slime,tag=Mns.HitBox.Ranposu.Head] run scoreboard players set @s Mns.Hitbox.PartId 0
        execute on passengers if entity @s[type=snowball,tag=aj.ranposu_aj.locator_origin] on origin if entity @s[type=slime,tag=Mns.HitBox.Ranposu.Body] run scoreboard players set @s Mns.Hitbox.PartId 1
    # Effect付与
        execute on passengers if entity @s[type=snowball,tag=aj.ranposu_aj.locator_origin] on origin if entity @s[type=slime] run effect give @s invisibility infinite 2 true
        execute on passengers if entity @s[type=snowball,tag=aj.ranposu_aj.locator_origin] on origin if entity @s[type=slime] run effect give @s fire_resistance infinite 2 true
    # 初期化完了
        execute on passengers if entity @s[type=snowball,tag=aj.ranposu_aj.locator_origin] on origin if entity @s[type=slime] run tag @s add Mns.HitBox.Init

# 部位耐久値
    # 基礎値取得
        execute store result score @s Mns.Ranposu.Head.Damage store result score @s Mns.Ranposu.Body.Damage run scoreboard players get @s Mns.Hp
    # 頭
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.HeadPartDamage
        # 計算
            scoreboard players operation @s Mns.Ranposu.Head.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Ranposu.Head.Damage.Max run scoreboard players operation @s Mns.Ranposu.Head.Damage /= #const_100 Const
    # 胴
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.BodyPartDamage
        # 計算
            scoreboard players operation @s Mns.Ranposu.Body.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Ranposu.Body.Damage.Max run scoreboard players operation @s Mns.Ranposu.Body.Damage /= #const_100 Const

# その他スコア初期化
    # 怯み回数
        scoreboard players set @s Mns.Ranposu.DamageCount 0

# アニメーション再生
    # 待機
        execute if entity @s[tag=Mns.Temp.IsIdleAnimation] run function animated_java:ranposu_aj/animations/idle/tween_play
