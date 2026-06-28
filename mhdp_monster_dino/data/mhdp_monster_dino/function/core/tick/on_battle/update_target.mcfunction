#> mhdp_monster_ranposu:core/tick/on_battle/update_target
#
# tick処理 戦闘中
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ターゲットリセット
    tag @a remove Mns.Target.Ranposu

# ヘイトが最も高いプレイヤーにターゲットタグを付与
    function mhdp_monsters:core/util/tick/fetch_player/check_max_hate.m {CandidateTag:"Mns.Candidate.Ranposu",TargetTag:"Mns.Target.Ranposu",Score:"Mns.Ranposu.Hate"}
    # 誰にも付与できなかった場合、最も近くのプレイヤーに付与
        execute unless entity @a[tag=Mns.Target.Ranposu] as @p[tag=Mns.Candidate.Ranposu] run tag @s add Mns.Target.Ranposu

# ターゲットになったプレイヤーのヘイトを減少
    scoreboard players remove @a[tag=Mns.Target.Ranposu] Mns.Ranposu.Hate 300
    execute as @a[tag=Mns.Target.Ranposu] if score @s Mns.Ranposu.Hate matches ..-1 run scoreboard players set @s Mns.Ranposu.Hate 0

# ターゲット変更用の行動回数リセット
    scoreboard players set @s Mns.General.ActCount.Target 0
