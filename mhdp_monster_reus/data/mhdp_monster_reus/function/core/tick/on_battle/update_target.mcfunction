#> mhdp_monster_reus:core/tick/on_battle/update_target
#
# tick処理 戦闘中 ターゲット更新
#
# @within function mhdp_monster_reus:core/tick/on_battle/check_target

# ターゲットリセット
    tag @a remove Mns.Target.Reus

# ヘイトが最も高いプレイヤーにターゲットタグを付与
    function mhdp_monsters:core/util/tick/fetch_player/check_max_hate.m {CandidateTag:"Mns.Candidate.Reus",TargetTag:"Mns.Target.Reus",Score:"Mns.Reus.Hate"}
    # 誰にも付与できなかった場合、最も近くのプレイヤーに付与
        execute unless entity @a[tag=Mns.Target.Reus] as @p[tag=Mns.Candidate.Reus] run tag @s add Mns.Target.Reus

# ターゲットになったプレイヤーのヘイトを減少
    scoreboard players remove @a[tag=Mns.Target.Reus] Mns.Reus.Hate 300
    execute as @a[tag=Mns.Target.Reus] if score @s Mns.Reus.Hate matches ..-1 run scoreboard players set @s Mns.Reus.Hate 0

# ターゲット変更用の行動回数リセット
    scoreboard players set @s Mns.General.ActCount.Target 0
