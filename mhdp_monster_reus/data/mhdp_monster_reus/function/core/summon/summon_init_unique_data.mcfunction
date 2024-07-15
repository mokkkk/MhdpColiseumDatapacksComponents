#> mhdp_monster_ranposu:core/summon/summon_init_unique_data
#
# データ初期化処理を行う 独自データの初期化
#
# @within function mhdp_monster_ranposu:core/summon/summon_init

# ボスバー作成
    bossbar add mhdp_monster:ranposu [{"text":"青鳥竜"},{"text":"\uE000","font":"minecraft:ui/monster_hp"}]
    execute store result bossbar mhdp_monster:ranposu max run scoreboard players get @s Mns.Hp
    execute store result bossbar mhdp_monster:ranposu value run scoreboard players get @s Mns.Hp

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

# 終了
    scoreboard players reset #mhdp_temp_monster_uid Mns.Uid

# アニメーション再生
    # 待機
        execute if entity @s[tag=Mns.Temp.IsIdleAnimation] run function animated_java:ranposu_aj/animations/idle/play
