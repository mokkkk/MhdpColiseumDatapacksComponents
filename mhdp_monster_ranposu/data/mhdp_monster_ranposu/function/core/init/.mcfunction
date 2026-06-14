#> mhdp_monster_ranposu:core/summon/init
#
# データ初期化処理を行う
#
# @within function mhdp_monster_ranposu:core/summon/summon

# 共通処理
    function mhdp_monsters:core/super/init/

# ボスバー作成
    bossbar add mhdp_monster:ranposu {"text":""}
    function mhdp_monsters:core/util/tick/update_bossbar.m {Monster:"ranposu",State:"relax"}
    execute store result bossbar mhdp_monster:ranposu max run scoreboard players get @s Mns.Hp
    execute store result bossbar mhdp_monster:ranposu value run scoreboard players get @s Mns.Hp

# 同士討ちダメージ有効化
    function mhdp_monsters:core/util/tick/event/enable_damage.m {Name:"ranposu"}

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
        execute if entity @s[tag=Mns.Temp.IsIdleAnimation] run function animated_java_ranposu:ranposu/animations/idle_relax/play
