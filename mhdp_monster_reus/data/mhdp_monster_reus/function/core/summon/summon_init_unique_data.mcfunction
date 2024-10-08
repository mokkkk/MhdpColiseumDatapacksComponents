#> mhdp_monster_reus:core/summon/summon_init_unique_data
#
# データ初期化処理を行う 独自データの初期化
#
# @within function mhdp_monster_reus:core/summon/summon_init

# ボスバー作成
    bossbar add mhdp_monster:reus [{"text":"火竜"},{"text":"\uE000","font":"minecraft:ui/monster_hp"}]
    execute store result bossbar mhdp_monster:reus max run scoreboard players get @s Mns.Hp
    execute store result bossbar mhdp_monster:reus value run scoreboard players get @s Mns.Hp

# 部位耐久値
    # 基礎値取得
        execute store result score @s Mns.Reus.Head.Damage store result score @s Mns.Reus.Body.Damage store result score @s Mns.Reus.Tail.Damage store result score @s Mns.Reus.LegR.Damage store result score @s Mns.Reus.LegL.Damage run scoreboard players get @s Mns.Hp
    # 頭
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.HeadPartDamage
        # 計算
            scoreboard players operation @s Mns.Reus.Head.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Reus.Head.Damage.Max run scoreboard players operation @s Mns.Reus.Head.Damage /= #const_100 Const
    # 胴
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.BodyPartDamage
        # 計算
            scoreboard players operation @s Mns.Reus.Body.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Reus.Body.Damage.Max run scoreboard players operation @s Mns.Reus.Body.Damage /= #const_100 Const
    # 尻尾
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.TailPartDamage
        # 計算
            scoreboard players operation @s Mns.Reus.Tail.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Reus.Tail.Damage.Max run scoreboard players operation @s Mns.Reus.Tail.Damage /= #const_100 Const
    # 右足
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.LegRPartDamage
        # 計算
            scoreboard players operation @s Mns.Reus.LegR.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Reus.LegR.Damage.Max run scoreboard players operation @s Mns.Reus.LegR.Damage /= #const_100 Const
    # 左足
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.LegLPartDamage
        # 計算
            scoreboard players operation @s Mns.Reus.LegL.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Reus.LegL.Damage.Max run scoreboard players operation @s Mns.Reus.LegL.Damage /= #const_100 Const

# その他スコア初期化
    # フェーズ
        scoreboard players set @s Mns.Reus.PhaseCount 0
    # 足怯み回数
        scoreboard players set @s Mns.Reus.Leg.Damage.Count 0
    # 空中怯み回数
        scoreboard players set @s Mns.Reus.Fly.Damage.Count 0
# 終了
    scoreboard players reset #mhdp_temp_monster_uid Mns.Uid

# アニメーション再生
    # 待機
        execute if entity @s[tag=Mns.Temp.IsIdleAnimation] run function animated_java:reus_aj/animations/land_idle/play
