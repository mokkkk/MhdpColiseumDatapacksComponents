#> mhdp_monsters:core/util/summon/init_common_data
# 
# 汎用処理 召喚時・共通データの初期化
#
# @within function mhdp_monsters:/**

# Uid設定
    scoreboard players operation @s Mns.Uid = #mhdp_temp_monster_uid Mns.Uid

# プレイヤー数を取得
    execute store result score #mhdp_temp_player_count MhdpCore if entity @a[tag=Ply.State.PlayingQuest]

# 実HP計算
    # HP取得
        execute store result score @s Mns.Hp run data get storage mhdp_core:temp TargetMonsterData.Hp
    # クエストによるHP倍率
        execute store result score #mhdp_temp_hp_multiply_quest MhdpCore run data get storage mhdp_core:game_data ActiveQuest.HpMultiply
    # プレイヤー数によるHP倍率
        scoreboard players remove #mhdp_temp_player_count MhdpCore 1
        scoreboard players operation #mhdp_temp_hp_multiply_playercount MhdpCore = #const_hp_playercount_multiply Const
        scoreboard players operation #mhdp_temp_hp_multiply_playercount MhdpCore *= #mhdp_temp_player_count MhdpCore
        scoreboard players add #mhdp_temp_hp_multiply_playercount MhdpCore 100
    # HP計算
        scoreboard players operation @s Mns.Hp *= #mhdp_temp_hp_multiply_quest MhdpCore
        scoreboard players operation @s Mns.Hp /= #const_100 Const
        scoreboard players operation @s Mns.Hp *= #mhdp_temp_hp_multiply_playercount MhdpCore
        execute store result score @s Mns.Hp.Half store result score @s Mns.Stun.Damage store result score @s Mns.Tire.Damage store result score @s Mns.Anger.Damage run scoreboard players operation @s Mns.Hp /= #const_100 Const
        scoreboard players operation @s Mns.Hp.Half /= #const_2 Const

# スタン耐性値
    # 倍率取得
        execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.StunDamagePer
    # 計算
        scoreboard players operation @s Mns.Stun.Damage *= #mhdp_temp_multiply MhdpCore
        execute store result score @s Mns.Stun.Damage.Max run scoreboard players operation @s Mns.Stun.Damage /= #const_100 Const

# 減気耐性値
    # 倍率取得
        execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.TireDamagePer
    # 計算
        scoreboard players operation @s Mns.Tire.Damage *= #mhdp_temp_multiply MhdpCore
        execute store result score @s Mns.Tire.Damage.Max run scoreboard players operation @s Mns.Tire.Damage /= #const_100 Const

# 怒り
    # 耐性値
        # 倍率取得
            execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.AngerDamagePer
        # 計算
            scoreboard players operation @s Mns.Anger.Damage *= #mhdp_temp_multiply MhdpCore
            execute store result score @s Mns.Anger.Damage.Max run scoreboard players operation @s Mns.Anger.Damage /= #const_100 Const
    # 継続時間
        execute store result score @s Mns.Anger.Timer store result score @s Mns.Anger.Timer.Max run data get storage mhdp_core:temp TargetMonsterData.AngerTimer
    # 攻撃力倍率
        execute store result score @s Mns.Anger.AttackMutiply run data get storage mhdp_core:temp TargetMonsterData.AngerAttackMult
    # 行動速度
        execute store result score @s Mns.Anger.Speed run data get storage mhdp_core:temp TargetMonsterData.AngerSpeed

# 麻痺
    # 耐性値
        # 基礎値取得
            execute store result score @s Mns.Paralysis.Damage run data get storage mhdp_core:temp TargetMonsterData.ParalysisDamage
        # フラグ
            execute if score @s Mns.Paralysis.Damage matches 1.. run tag @s add Mns.Param.IsParalysisEnable
        # 計算
            scoreboard players operation @s Mns.Paralysis.Damage *= #mhdp_temp_hp_multiply_playercount MhdpCore
            execute store result score @s Mns.Paralysis.Damage.Max run scoreboard players operation @s Mns.Paralysis.Damage /= #const_100 Const
    # 継続時間
        execute store result score @s Mns.Paralysis.Timer store result score @s Mns.Paralysis.Timer.Max run data get storage mhdp_core:temp TargetMonsterData.ParalysisTimer

# 毒
    # 耐性値
        # 基礎値取得
            execute store result score @s Mns.Poison.Damage run data get storage mhdp_core:temp TargetMonsterData.PoisonDamage
        # フラグ
            execute if score @s Mns.Poison.Damage matches 1.. run tag @s add Mns.Param.IsPoisonEnable
        # 計算
            scoreboard players operation @s Mns.Poison.Damage *= #mhdp_temp_hp_multiply_playercount MhdpCore
            execute store result score @s Mns.Poison.Damage.Max run scoreboard players operation @s Mns.Poison.Damage /= #const_100 Const
    # 継続時間
        execute store result score @s Mns.Poison.Timer store result score @s Mns.Poison.Timer.Max run data get storage mhdp_core:temp TargetMonsterData.PoisonTimer
    # 効果ダメージ
        # 基礎値取得
            execute store result score @s Mns.Poison.Effect.Value run data get storage mhdp_core:temp TargetMonsterData.PoisonEffectDamage
        # 計算
            scoreboard players operation @s Mns.Poison.Effect.Value *= @s Mns.Hp
            scoreboard players operation @s Mns.Poison.Effect.Value /= #const_100 Const
            scoreboard players operation @s Mns.Poison.Effect.Value /= #const_100 Const

# 爆破
    # 耐性値
        # 基礎値取得
            execute store result score @s Mns.Bomb.Damage run data get storage mhdp_core:temp TargetMonsterData.BombDamage
        # フラグ
            execute if score @s Mns.Bomb.Damage matches 1.. run tag @s add Mns.Param.IsBombEnable
        # 計算
            scoreboard players operation @s Mns.Bomb.Damage *= #mhdp_temp_hp_multiply_playercount MhdpCore
            execute store result score @s Mns.Bomb.Damage.Max run scoreboard players operation @s Mns.Bomb.Damage /= #const_100 Const
    # 効果ダメージ
        # 基礎値取得
            execute store result score @s Mns.Bomb.Effect.Value run data get storage mhdp_core:temp TargetMonsterData.BombEffectDamage

# 龍気
    # 耐性値
        execute store result score @s Mns.DragonAura.Damage store result score @s Mns.DragonAura.Damage.Max run scoreboard players get #const_dragonaura_damage_initial_value Const

# その他
    # ハードコア
        execute if data storage mhdp_core:game_data {IsHardcore:true} run tag @s add Mns.Param.IsHardcore
    # HP表示
        execute if data storage mhdp_core:temp TargetMonsterData{ShowHp:false} run tag @s add Mns.Param.IsHideHp
    # 閃光玉
        execute if data storage mhdp_core:temp TargetMonsterData{FlashBombEnable:true} run tag @s add Mns.Param.IsFlashBombEnable
    # 音爆弾
        execute if data storage mhdp_core:temp TargetMonsterData{SoundBombEnable:true} run tag @s add Mns.Param.IsSoundBombEnable
    # 痺れ罠
        # フラグ
            execute if data storage mhdp_core:temp TargetMonsterData{ParalyseTrapEnable:true} run tag @s add Mns.Param.IsParalyseTrapEnable
        # 継続時間
            execute store result score @s Mns.ParalyseTrap.Timer store result score @s Mns.ParalyseTrap.Timer.Max run data get storage mhdp_core:temp TargetMonsterData.ParalyseTrapTimer
    # 落とし穴
        # フラグ
            execute if data storage mhdp_core:temp TargetMonsterData{HallTrapEnable:true} run tag @s add Mns.Param.IsHallTrapEnable
        # 継続時間
            execute store result score @s Mns.HallTrap.Timer store result score @s Mns.HallTrap.Timer.Max run data get storage mhdp_core:temp TargetMonsterData.HallTrapTimer
    # モデルのnbt設定
        data modify entity @s teleport_duration set value 1
        execute on passengers if entity @s[type=item_display] run data modify entity @s teleport_duration set value 1
        execute if data storage mhdp_core:game_data ActiveQuest{Time:"day"} on passengers if entity @s[type=item_display] run data modify entity @s brightness set value {sky:15,block:15}
        execute if data storage mhdp_core:game_data ActiveQuest{Time:"night"} on passengers if entity @s[type=item_display] run data modify entity @s brightness set value {sky:3,block:3}
    # スコア初期化
        # 怒り中の行動速度増加
            scoreboard players set @s Mns.Temp.AngerSpeed.Timer 0
        # 連続行動回数
            scoreboard players set @s Mns.General.ActCount.Idle 0
            scoreboard players set @s Mns.General.ActCount.Target 0

# 終了
    scoreboard players reset #mhdp_temp_player_count MhdpCore
    scoreboard players reset #mhdp_temp_multiply MhdpCore
    scoreboard players reset #mhdp_temp_hp_multiply_quest MhdpCore
    scoreboard players reset #mhdp_temp_hp_multiply_playercount MhdpCore
