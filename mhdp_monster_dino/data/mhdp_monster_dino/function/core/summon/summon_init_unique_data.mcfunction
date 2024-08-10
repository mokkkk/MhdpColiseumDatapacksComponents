#> mhdp_monster_dino:core/summon/summon_init_unique_data
#
# データ初期化処理を行う 独自データの初期化
#
# @within function mhdp_monster_dino:core/summon/summon_init

# ボスバー作成
    bossbar add mhdp_monster:dino [{"text":"火竜"},{"text":"\uE000","font":"minecraft:ui/monster_hp"}]
    execute store result bossbar mhdp_monster:dino max run scoreboard players get @s Mns.Hp
    execute store result bossbar mhdp_monster:dino value run scoreboard players get @s Mns.Hp

# 部位耐久値
    # 基礎値取得
        execute store result score @s Mns.Dino.Head.Damage store result score @s Mns.Dino.Body.Damage store result score @s Mns.Dino.Tail.Damage store result score @s Mns.Dino.LegR.Damage store result score @s Mns.Dino.LegL.Damage run scoreboard players get @s Mns.Hp
    # 頭
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.HeadPartDamage
        # 計算
            scoreboard players operation @s Mns.Dino.Head.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Dino.Head.Damage.Max store result score @s Mns.Dino.Sp.RedHead.Damage store result score @s Mns.Dino.Sp.RedHead.Damage.Max run scoreboard players operation @s Mns.Dino.Head.Damage /= #const_100 Const
    # 胴
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.BodyPartDamage
        # 計算
            scoreboard players operation @s Mns.Dino.Body.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Dino.Body.Damage.Max run scoreboard players operation @s Mns.Dino.Body.Damage /= #const_100 Const
    # 尻尾
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.TailPartDamage
        # 計算
            scoreboard players operation @s Mns.Dino.Tail.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Dino.Tail.Damage.Max run scoreboard players operation @s Mns.Dino.Tail.Damage /= #const_100 Const
    # 右足
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.LegRPartDamage
        # 計算
            scoreboard players operation @s Mns.Dino.LegR.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Dino.LegR.Damage.Max run scoreboard players operation @s Mns.Dino.LegR.Damage /= #const_100 Const
    # 左足
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.LegLPartDamage
        # 計算
            scoreboard players operation @s Mns.Dino.LegL.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Dino.LegL.Damage.Max run scoreboard players operation @s Mns.Dino.LegL.Damage /= #const_100 Const

# その他スコア初期化
    # フェーズ
        scoreboard players set @s Mns.Dino.PhaseCount.Tail 0
        scoreboard players set @s Mns.Dino.PhaseCount.Head 0
    # 足怯み回数
        scoreboard players set @s Mns.Dino.Leg.Damage.Count 0
# 終了
    scoreboard players reset #mhdp_temp_monster_uid Mns.Uid

# アニメーション再生
    # 待機
        execute if entity @s[tag=Mns.Temp.IsIdleAnimation] run function animated_java:dino_aj/animations/idle/play
