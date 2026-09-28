#> mhdp_monster_valk:core/tick/on_battle/start
#
# tick処理 戦闘中 開始
#
# @within function mhdp_monster_valk:core/tick/on_caution/tick

# フェーズ変更
    scoreboard players set @s Mns.General.Phase 2

# ! 表示
    kill @n[type=text_display,tag=9.Valk,distance=..10]
    data modify storage api: Arg.Override.Text set value "!"
    data modify storage api: Arg.Override.Tag set value "Valk"
    data modify storage api: Arg.Override.Scale set value 2
    data modify storage api: Arg.Override.Height set value 0.4
    execute positioned as @n[type=slime,tag=Mns.HitBox.Valk.Head] run function api:object/summon.m {ObjectId:9}
    execute as @n[type=text_display,tag=9.Valk,distance=..10] run ride @s mount @n[type=slime,tag=Mns.HitBox.Valk.Head]

# ボスバー名更新
    function mhdp_monsters:core/util/tick/update_bossbar.m {Monster:"valk",State:"battle"}

# 初回遭遇時
    # この時点で発見されているプレイヤーに大きなヘイトを与える
        execute as @a[tag=Mns.Candidate.Valk,scores={Mns.Valk.Search=1000..}] run scoreboard players add @s Mns.Valk.Hate 300
    # 咆哮アニメーション再生
        execute unless entity @s[tag=Mns.State.IsBattle] run tag @s add Mns.Temp.Anim.IsFirstContact
    # 戦闘状態開始
        tag @s add Mns.State.IsBattle
