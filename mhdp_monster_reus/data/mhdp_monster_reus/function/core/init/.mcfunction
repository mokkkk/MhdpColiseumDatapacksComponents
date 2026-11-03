#> mhdp_monster_reus:core/init/
#
# データ初期化処理を行う
#
# @within function mhdp_monster_reus:core/summon/*

# 共通処理
    function mhdp_monsters:core/super/init/

# ボスバー作成
    bossbar add mhdp_monster:reus {"text":""}
    function mhdp_monsters:core/util/tick/update_bossbar.m {Monster:"reus",State:"relax"}
    execute store result bossbar mhdp_monster:reus max run scoreboard players get @s Mns.Hp
    execute store result bossbar mhdp_monster:reus value run scoreboard players get @s Mns.Hp

# 同士討ちダメージ有効化
    function mhdp_monsters:core/util/tick/event/enable_damage.m {Name:"reus"}

# 部位耐久値 (Mns.Hp × <Part>PartDamage / 100)
    # 頭
        # 基礎値取得
            execute store result score @s Mns.Reus.Head.Damage run scoreboard players get @s Mns.Hp
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.HeadPartDamage
        # 計算
            scoreboard players operation @s Mns.Reus.Head.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Reus.Head.Damage.Max run scoreboard players operation @s Mns.Reus.Head.Damage /= #const_100 Const
    # 胴
        # 基礎値取得
            execute store result score @s Mns.Reus.Body.Damage run scoreboard players get @s Mns.Hp
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.BodyPartDamage
        # 計算
            scoreboard players operation @s Mns.Reus.Body.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Reus.Body.Damage.Max run scoreboard players operation @s Mns.Reus.Body.Damage /= #const_100 Const
    # 尻尾
        # 基礎値取得
            execute store result score @s Mns.Reus.Tail.Damage run scoreboard players get @s Mns.Hp
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.TailPartDamage
        # 計算
            scoreboard players operation @s Mns.Reus.Tail.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Reus.Tail.Damage.Max run scoreboard players operation @s Mns.Reus.Tail.Damage /= #const_100 Const
    # 右脚
        # 基礎値取得
            execute store result score @s Mns.Reus.LegR.Damage run scoreboard players get @s Mns.Hp
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.LegRPartDamage
        # 計算
            scoreboard players operation @s Mns.Reus.LegR.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Reus.LegR.Damage.Max run scoreboard players operation @s Mns.Reus.LegR.Damage /= #const_100 Const
    # 左脚
        # 基礎値取得
            execute store result score @s Mns.Reus.LegL.Damage run scoreboard players get @s Mns.Hp
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.LegLPartDamage
        # 計算
            scoreboard players operation @s Mns.Reus.LegL.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Reus.LegL.Damage.Max run scoreboard players operation @s Mns.Reus.LegL.Damage /= #const_100 Const

# その他スコア初期化
    # 怯み回数
        scoreboard players set @s Mns.Reus.Head.Damage.Count 0
        scoreboard players set @s Mns.Reus.Body.Damage.Count 0
        scoreboard players set @s Mns.Reus.Tail.Damage.Count 0
        scoreboard players set @s Mns.Reus.LegR.Damage.Count 0
        scoreboard players set @s Mns.Reus.LegL.Damage.Count 0

# 終了
    scoreboard players reset #mhdp_temp_monster_uid Mns.Uid

# アニメーション再生
    # 待機
        execute if entity @s[tag=Mns.Temp.IsIdleAnimation] run function animated_java_reus:reus/animations/idle_relax/play
