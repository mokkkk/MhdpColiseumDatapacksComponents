#> mhdp_monster_dino:core/tick/on_battle/update_target
#
# tick処理 戦闘中
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ターゲットリセット
    tag @a remove Mns.Target.Dino

# ヘイトが最も高いプレイヤーにターゲットタグを付与
    function mhdp_monsters:core/util/tick/fetch_player/check_max_hate.m {CandidateTag:"Mns.Candidate.Dino",TargetTag:"Mns.Target.Dino",Score:"Mns.Dino.Hate"}
    # 誰にも付与できなかった場合、最も近くのプレイヤーに付与
        execute unless entity @a[tag=Mns.Target.Dino] as @p[tag=Mns.Candidate.Dino] run tag @s add Mns.Target.Dino

# ターゲットになったプレイヤーのヘイトを減少
    scoreboard players remove @a[tag=Mns.Target.Dino] Mns.Dino.Hate 300
    execute as @a[tag=Mns.Target.Dino] if score @s Mns.Dino.Hate matches ..-1 run scoreboard players set @s Mns.Dino.Hate 0

# ターゲット変更用の行動回数リセット
    scoreboard players set @s Mns.General.ActCount.Target 0
