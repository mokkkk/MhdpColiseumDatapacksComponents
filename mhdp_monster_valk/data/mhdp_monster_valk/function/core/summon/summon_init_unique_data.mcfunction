#> mhdp_monster_valk:core/summon/summon_init_unique_data
#
# データ初期化処理を行う 独自データの初期化
#
# @within function mhdp_monster_valk:core/summon/summon_init

# ボスバー作成
    bossbar add mhdp_monster:valk [{"text":"天彗龍"},{"text":"\uE000","font":"minecraft:ui/monster_hp"}]
    execute store result bossbar mhdp_monster:valk max run scoreboard players get @s Mns.Hp
    execute store result bossbar mhdp_monster:valk value run scoreboard players get @s Mns.Hp

# 部位耐久値
    # 基礎値取得
        execute store result score @s Mns.Valk.Head.Damage store result score @s Mns.Valk.Body.Damage store result score @s Mns.Valk.Tail.Damage store result score @s Mns.Valk.ArmR.Damage store result score @s Mns.Valk.ArmL.Damage store result score @s Mns.Valk.LegR.Damage store result score @s Mns.Valk.LegL.Damage store result score @s Mns.Valk.WingR.Damage store result score @s Mns.Valk.WingL.Damage run scoreboard players get @s Mns.Hp
    # 頭
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.HeadPartDamage
        # 計算
            scoreboard players operation @s Mns.Valk.Head.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Valk.Head.Damage.Max run scoreboard players operation @s Mns.Valk.Head.Damage /= #const_100 Const
    # 胴
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.BodyPartDamage
        # 計算
            scoreboard players operation @s Mns.Valk.Body.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Valk.BodySp.Damage.Max store result score @s Mns.Valk.BodySp.Damage store result score @s Mns.Valk.Body.Damage.Max run scoreboard players operation @s Mns.Valk.Body.Damage /= #const_100 Const
    # 尻尾
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.TailPartDamage
        # 計算
            scoreboard players operation @s Mns.Valk.Tail.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Valk.Tail.Damage.Max run scoreboard players operation @s Mns.Valk.Tail.Damage /= #const_100 Const
    # 右腕
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.ArmRPartDamage
        # 計算
            scoreboard players operation @s Mns.Valk.ArmR.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Valk.ArmR.Damage.Max run scoreboard players operation @s Mns.Valk.ArmR.Damage /= #const_100 Const
    # 左腕
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.ArmLPartDamage
        # 計算
            scoreboard players operation @s Mns.Valk.ArmL.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Valk.ArmL.Damage.Max run scoreboard players operation @s Mns.Valk.ArmL.Damage /= #const_100 Const
    # 右足
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.LegRPartDamage
        # 計算
            scoreboard players operation @s Mns.Valk.LegR.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Valk.LegR.Damage.Max run scoreboard players operation @s Mns.Valk.LegR.Damage /= #const_100 Const
    # 左足
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.LegLPartDamage
        # 計算
            scoreboard players operation @s Mns.Valk.LegL.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Valk.LegL.Damage.Max run scoreboard players operation @s Mns.Valk.LegL.Damage /= #const_100 Const
    # 右翼
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.WingRPartDamage
        # 計算
            scoreboard players operation @s Mns.Valk.WingR.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Valk.WingR.Damage.Max run scoreboard players operation @s Mns.Valk.WingR.Damage /= #const_100 Const
    # 左翼
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.WingLPartDamage
        # 計算
            scoreboard players operation @s Mns.Valk.WingL.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Valk.WingL.Damage.Max run scoreboard players operation @s Mns.Valk.WingL.Damage /= #const_100 Const

# その他スコア初期化
    # フェーズ
        scoreboard players set @s Mns.Valk.PhaseCount 0
    # 足怯み回数
        scoreboard players set @s Mns.Valk.LegR.Damage.Count 0
        scoreboard players set @s Mns.Valk.LegL.Damage.Count 0
    # 移動回数
        scoreboard players set @s Mns.Valk.DashCount 0

# テキストディスプレイ設定
    execute on passengers if entity @s[tag=aj.valk_aj.bone.comet_star] run data merge entity @s {view_range:30f}

# 終了
    scoreboard players reset #mhdp_temp_monster_uid Mns.Uid

# アニメーション再生
    # 待機
        execute if entity @s[tag=Mns.Temp.IsIdleAnimation] run function animated_java:valk_aj/animations/lance_idle/play
