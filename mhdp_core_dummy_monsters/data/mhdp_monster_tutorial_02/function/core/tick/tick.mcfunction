#> mhdp_monster_tutorial_02:core/tick/tick
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タイマー増加
    scoreboard players add @s Mns.General.DummyTimer 1

# BC
# 一定時間後
    execute if entity @s[tag=!Mns.Tutorial02.Bc] if score @s Mns.General.DummyTimer matches 5.. unless score @s Mns.General.DummyCounter matches 0.. run function mhdp_monster_tutorial_02:core/tick/00_bc/start
    execute if score @s Mns.General.DummyCounter matches 1 run function mhdp_monster_tutorial_02:core/tick/00_bc/main

# 武器の抜刀
# フィールドに移動した後
    execute if entity @s[tag=!Mns.Tutorial02.Draw] if entity @a[tag=Ply.State.PlayingQuest,tag=Ply.State.MnsTarget] unless score @s Mns.General.DummyCounter matches 0.. run function mhdp_monster_tutorial_02:core/tick/01_draw/start
    execute if score @s Mns.General.DummyCounter matches 2 run function mhdp_monster_tutorial_02:core/tick/01_draw/main

# 武器の攻撃
# 武器の抜刀の説明後
    # 開始は上記武器の抜刀内で行う
    execute if score @s Mns.General.DummyCounter matches 3 run function mhdp_monster_tutorial_02:core/tick/02_attack/main

# 回復
# 攻撃に被弾した後
    execute if entity @s[tag=!Mns.Tutorial02.Heal] if entity @a[tag=Ply.State.PlayingQuest,scores={Ply.Health=..14}] unless score @s Mns.General.DummyCounter matches 0.. run function mhdp_monster_tutorial_02:core/tick/03_heal/start
    execute if score @s Mns.General.DummyCounter matches 4 run function mhdp_monster_tutorial_02:core/tick/03_heal/main

# スタミナ
# スタミナが減った後
    execute if entity @s[tag=!Mns.Tutorial02.Stamina] if entity @a[tag=Ply.State.PlayingQuest,scores={Ply.Stats.Stamina=..700}] unless score @s Mns.General.DummyCounter matches 0.. run function mhdp_monster_tutorial_02:core/tick/04_stamina/start
    execute if score @s Mns.General.DummyCounter matches 5 run function mhdp_monster_tutorial_02:core/tick/04_stamina/main

# 斬れ味
# 斬れ味が減った後
    execute if entity @s[tag=!Mns.Tutorial02.Sharpness] if entity @a[tag=Ply.State.PlayingQuest,tag=!Ply.Weapon.Equip.Bow,scores={Ply.Stats.CurrentSharpnessColor=..2}] unless score @s Mns.General.DummyCounter matches 0.. run function mhdp_monster_tutorial_02:core/tick/05_sharpness/start
    execute if score @s Mns.General.DummyCounter matches 6 run function mhdp_monster_tutorial_02:core/tick/05_sharpness/main

# 怒り状態
# 怒り状態になった後
    execute if entity @s[tag=!Mns.Tutorial02.Anger] if entity @n[tag=Mns.Root.Ranposu,tag=Mns.State.IsAnger] unless score @s Mns.General.DummyCounter matches 0.. run function mhdp_monster_tutorial_02:core/tick/06_anger/start
    execute if score @s Mns.General.DummyCounter matches 7 run function mhdp_monster_tutorial_02:core/tick/06_anger/main

# 怯み
# モンスターが怯んだ後
    execute if entity @s[tag=Mns.Tutorial02.Draw,tag=!Mns.Tutorial02.Damage] if entity @n[tag=Mns.Root.Ranposu,tag=!Mns.State.Tutorial.IsBroken] unless score @s Mns.General.DummyCounter matches 0.. run function mhdp_monster_tutorial_02:core/tick/07_damage/start
    execute if score @s Mns.General.DummyCounter matches 8 run function mhdp_monster_tutorial_02:core/tick/07_damage/main

# 訓練所・チュートリアル
# モンスター討伐後
    execute if entity @s[tag=!Mns.Tutorial02.End] if entity @n[tag=Mns.Root.Ranposu,tag=Mns.State.Death] unless score @s Mns.General.DummyCounter matches 0.. run function mhdp_monster_tutorial_02:core/tick/08_end/start
    execute if score @s Mns.General.DummyCounter matches 9 run function mhdp_monster_tutorial_02:core/tick/08_end/main

# 終了
    # 開始は上記武器の訓練所・チュートリアル内で行う

# ループ
    # execute if score @s Mns.General.DummyTimer matches 1800.. run scoreboard players set @s Mns.General.DummyTimer 0
