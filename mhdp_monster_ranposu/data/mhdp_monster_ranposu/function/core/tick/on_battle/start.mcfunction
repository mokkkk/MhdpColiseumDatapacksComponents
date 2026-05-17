#> mhdp_monster_ranposu:core/tick/on_battle/start
#
# tick処理 戦闘中 開始
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# フェーズ変更
    scoreboard players set @s Mns.General.Phase 2

# ! 表示
    kill @n[type=text_display,tag=9.Ranposu,distance=..10]
    data modify storage api: Arg.Override.Text set value "!"
    data modify storage api: Arg.Override.Tag set value "Ranposu"
    data modify storage api: Arg.Override.Scale set value 2
    data modify storage api: Arg.Override.Height set value 0.4
    execute positioned as @n[type=slime,tag=Mns.HitBox.Ranposu.Head] run function api:object/summon.m {ObjectId:9}
    execute as @n[type=text_display,tag=9.Ranposu,distance=..10] run ride @s mount @n[type=slime,tag=Mns.HitBox.Ranposu.Head]

# ボスバー名更新
    function mhdp_monsters:core/util/tick/update_bossbar.m {Monster:"ranposu",State:"battle"}

# 初回遭遇時
    # この時点で発見されているプレイヤーに大きなヘイトを与える
        execute as @a[tag=Mns.Candidate.Ranposu,scores={Mns.Ranposu.Search=1000..}] run scoreboard players add @s Mns.Ranposu.Hate 300
    # 咆哮アニメーション再生
        execute unless entity @s[tag=Mns.State.IsBattle] run tag @s add Mns.Temp.Anim.IsFirstContact
    # 戦闘状態開始
        tag @s add Mns.State.IsBattle
