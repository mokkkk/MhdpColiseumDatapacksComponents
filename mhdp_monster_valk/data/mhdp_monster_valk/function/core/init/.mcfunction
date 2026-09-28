#> mhdp_monster_valk:core/init/
#
# 召喚直後のステータス計算・ボスバー生成・待機アニメ再生
#
# @within function mhdp_monster_valk:core/summon/summon

# 共通処理 (実HP・耐性値・怒り/麻痺/毒/爆破/罠のパラメータ計算、当たり判定初期化)
    function mhdp_monsters:core/super/init/

# ボスバー作成
    bossbar add mhdp_monster:valk {"text":""}
    function mhdp_monsters:core/util/tick/update_bossbar.m {Monster:"valk",State:"relax"}
    execute store result bossbar mhdp_monster:valk max run scoreboard players get @s Mns.Hp
    execute store result bossbar mhdp_monster:valk value run scoreboard players get @s Mns.Hp

# 同士討ちダメージ有効化
    function mhdp_monsters:core/util/tick/event/enable_damage.m {Name:"valk"}

# 部位耐久値
    # 基礎値取得
        execute store result score @s Mns.Valk.Head.Damage store result score @s Mns.Valk.Body.Damage store result score @s Mns.Valk.Tail.Damage store result score @s Mns.Valk.ArmR.Damage store result score @s Mns.Valk.ArmL.Damage store result score @s Mns.Valk.LegR.Damage store result score @s Mns.Valk.LegL.Damage store result score @s Mns.Valk.WingR.Damage store result score @s Mns.Valk.WingL.Damage run scoreboard players get @s Mns.Hp
    # 頭
        execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.HeadPartDamage
        scoreboard players operation @s Mns.Valk.Head.Damage *= #mhdp_temp_multiply MhdpCore
        execute store result score @s Mns.Valk.Head.Damage.Max run scoreboard players operation @s Mns.Valk.Head.Damage /= #const_100 Const
    # 胴 (吸引中の胸耐久値 BodySp も胴から算出)
        execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.BodyPartDamage
        scoreboard players operation @s Mns.Valk.Body.Damage *= #mhdp_temp_multiply MhdpCore
        execute store result score @s Mns.Valk.BodySp.Damage.Max store result score @s Mns.Valk.BodySp.Damage store result score @s Mns.Valk.Body.Damage.Max run scoreboard players operation @s Mns.Valk.Body.Damage /= #const_100 Const
    # 尻尾
        execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.TailPartDamage
        scoreboard players operation @s Mns.Valk.Tail.Damage *= #mhdp_temp_multiply MhdpCore
        execute store result score @s Mns.Valk.Tail.Damage.Max run scoreboard players operation @s Mns.Valk.Tail.Damage /= #const_100 Const
    # 右腕
        execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.ArmRPartDamage
        scoreboard players operation @s Mns.Valk.ArmR.Damage *= #mhdp_temp_multiply MhdpCore
        execute store result score @s Mns.Valk.ArmR.Damage.Max run scoreboard players operation @s Mns.Valk.ArmR.Damage /= #const_100 Const
    # 左腕
        execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.ArmLPartDamage
        scoreboard players operation @s Mns.Valk.ArmL.Damage *= #mhdp_temp_multiply MhdpCore
        execute store result score @s Mns.Valk.ArmL.Damage.Max run scoreboard players operation @s Mns.Valk.ArmL.Damage /= #const_100 Const
    # 右足
        execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.LegRPartDamage
        scoreboard players operation @s Mns.Valk.LegR.Damage *= #mhdp_temp_multiply MhdpCore
        execute store result score @s Mns.Valk.LegR.Damage.Max run scoreboard players operation @s Mns.Valk.LegR.Damage /= #const_100 Const
    # 左足
        execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.LegLPartDamage
        scoreboard players operation @s Mns.Valk.LegL.Damage *= #mhdp_temp_multiply MhdpCore
        execute store result score @s Mns.Valk.LegL.Damage.Max run scoreboard players operation @s Mns.Valk.LegL.Damage /= #const_100 Const
    # 右翼
        execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.WingRPartDamage
        scoreboard players operation @s Mns.Valk.WingR.Damage *= #mhdp_temp_multiply MhdpCore
        execute store result score @s Mns.Valk.WingR.Damage.Max run scoreboard players operation @s Mns.Valk.WingR.Damage /= #const_100 Const
    # 左翼
        execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.WingLPartDamage
        scoreboard players operation @s Mns.Valk.WingL.Damage *= #mhdp_temp_multiply MhdpCore
        execute store result score @s Mns.Valk.WingL.Damage.Max run scoreboard players operation @s Mns.Valk.WingL.Damage /= #const_100 Const

# 固有スコア初期化
    # 内部フェーズ・大技カウント
        scoreboard players set @s Mns.Valk.PhaseCount 0
        scoreboard players set @s Mns.Valk.PhaseCount.Comet 0
        scoreboard players set @s Mns.Valk.PhaseCount.Move 0
        scoreboard players set @s Mns.Valk.PhaseCount.Beam 0
    # 怯み回数
        scoreboard players set @s Mns.Valk.Head.Damage.Count 0
        scoreboard players set @s Mns.Valk.Tail.Damage.Count 0
        scoreboard players set @s Mns.Valk.ArmR.Damage.Count 0
        scoreboard players set @s Mns.Valk.ArmL.Damage.Count 0
        scoreboard players set @s Mns.Valk.LegR.Damage.Count 0
        scoreboard players set @s Mns.Valk.LegL.Damage.Count 0
    # 各種カウント
        scoreboard players set @s Mns.Valk.DashCount 0
        scoreboard players set @s Mns.Valk.SubCount 0
        scoreboard players set @s Mns.Valk.JetCount 0
        scoreboard players set @s Mns.Valk.ChargeCount 0
        scoreboard players set @s Mns.Valk.EndAngerCount 0
        scoreboard players set @s Mns.Valk.MoveSkill.CoolDown 0

# テキストディスプレイ設定 (彗星の星VFXボーンの描画距離)
    #TODO: 再エクスポート後のボーン名 'comet_star' を確認
    function animated_java_valk:valk/as_node {name: 'comet_star', command: 'data merge entity @s {view_range:30f}'}

# 終了
    scoreboard players reset #mhdp_temp_monster_uid Mns.Uid

# 待機アニメーション再生
    execute if entity @s[tag=Mns.Temp.IsIdleAnimation] run function animated_java_valk:valk/animations/lance_idle/play
