#> mhdp_monster_valk:core/tick/on_battle/update_target
#
# tick処理 戦闘中 ターゲット更新
#
# @within function mhdp_monster_valk:core/tick/on_battle/check_target

# ターゲットリセット
    tag @a remove Mns.Target.Valk

# ヘイトが最も高いプレイヤーにターゲットタグを付与
    function mhdp_monsters:core/util/tick/fetch_player/check_max_hate.m {CandidateTag:"Mns.Candidate.Valk",TargetTag:"Mns.Target.Valk",Score:"Mns.Valk.Hate"}
    # 誰にも付与できなかった場合、最も近くのプレイヤーに付与
        execute unless entity @a[tag=Mns.Target.Valk] as @p[tag=Mns.Candidate.Valk] run tag @s add Mns.Target.Valk

# ターゲットになったプレイヤーのヘイトを減少
    scoreboard players remove @a[tag=Mns.Target.Valk] Mns.Valk.Hate 300
    execute as @a[tag=Mns.Target.Valk] if score @s Mns.Valk.Hate matches ..-1 run scoreboard players set @s Mns.Valk.Hate 0

# ターゲット変更用の行動回数リセット
    scoreboard players set @s Mns.General.ActCount.Target 0
