#> mhdp_monster_ranposu:core/tick/on_battle/start_ambush
#
# tick処理 戦闘中 開始
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 攻撃者にヘイト、発見値を与える
    execute as @a[tag=Temp.Attacker] run scoreboard players set @s Mns.Ranposu.Search 1000
    execute as @a[tag=Temp.Attacker] run scoreboard players add @s Mns.Ranposu.Hate 500

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

# 戦闘状態開始
    tag @s add Mns.State.IsBattle

# 怯みアニメーション再生
    function mhdp_monster_ranposu:core/damage/reaction/ambush
