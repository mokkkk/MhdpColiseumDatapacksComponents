#> mhdp_monster_valk:core/tick/on_battle/start_ambush
#
# tick処理 戦闘中 開始 (非戦闘中に被弾したとき)
#
# @within function mhdp_monster_valk:core/damage/damage

# 攻撃者にヘイト、発見値を与える
    execute as @a[tag=Temp.Attacker] run scoreboard players set @s Mns.Valk.Search 1000
    execute as @a[tag=Temp.Attacker] run scoreboard players add @s Mns.Valk.Hate 500

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

# 戦闘状態開始
    tag @s add Mns.State.IsBattle

# 怯みアニメーション再生
    function mhdp_monster_valk:core/damage/reaction/ambush
