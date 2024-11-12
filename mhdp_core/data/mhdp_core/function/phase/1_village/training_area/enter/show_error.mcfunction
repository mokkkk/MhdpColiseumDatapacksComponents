#> mhdp_core:phase/1_village/change_phase/show_error
#
# 次Phaseへ遷移できるか確認する
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 共通表示
    tellraw @s {"text":"【ERROR!:訓練所の利用条件を満たしていません。以下をご確認ください。】","color": "red"}

# プレイヤー関連のエラー内容に応じた表示
    # 体験版：武器を選択していない
        execute if entity @s[tag=Ply.Temp.Error.BetaNotSelectedWeapon] run tellraw @a[tag=Ply.Temp.Error.BetaNotSelectedWeapon] [{"text":" - 【使用する武器を選択してください】","color": "red"}]
    # ゲームモード
        execute if entity @s[tag=Ply.Temp.Error.Gamemode] run tellraw @a[tag=Ply.State.QuestMember] [{"text":" - 【ゲームモードをアドベンチャーに設定してください】","color": "red"}]
    # カーソルにアイテムを保持している
        execute if entity @s[tag=Ply.Temp.Error.HasCursorItem] run tellraw @a[tag=Ply.State.QuestMember] [{"text":" - 【カーソルにアイテムを持たないでください】","color": "red"}]
    # 武器を持っていない
        execute if entity @s[tag=Ply.Temp.Error.HasNotWeapons] run tellraw @a[tag=Ply.State.QuestMember] [{"text":" - 【武器を所持してください】","color": "red"}]
    # 武器を2つ以上持っている
        execute if entity @s[tag=Ply.Temp.Error.HasManyWeapons] run tellraw @a[tag=Ply.State.QuestMember] [{"text":" - 【武器は1つまでしか所持できません】","color": "red"}]
    # 武器をオフハンドにセットしていない
        execute if entity @s[tag=Ply.Temp.Error.HasNotWeaponOffhand] run tellraw @a[tag=Ply.State.QuestMember] [{"text":" - 【武器はオフハンドに所持してください】","color": "red"}]
    # 特殊装具を3つ以上持っている
        execute if entity @s[tag=Ply.Temp.Error.HasManySpItems] run tellraw @a[tag=Ply.State.QuestMember] [{"text":" - 【特殊装具は2つまでしか所持できません】","color": "red"}]
    # 同じ特殊装具を2つ以上持っている
        execute if entity @s[tag=Ply.Temp.Error.DuplicateSpItems] run tellraw @a[tag=Ply.State.QuestMember] [{"text":" - 【同じ種類の特殊装具は1つまでしか所持できません】","color": "red"}]

# 終了
    tag @a remove Ply.Temp.Error.BetaNotSelectedWeapon
    tag @a remove Ply.Temp.Error.Gamemode
    tag @a remove Ply.Temp.Error.HasCursorItem
    tag @a remove Ply.Temp.Error.HasNotWeapons
    tag @a remove Ply.Temp.Error.HasManyWeapons
    tag @a remove Ply.Temp.Error.HasNotWeaponOffhand
    tag @a remove Ply.Temp.Error.HasManySpItems
    tag @a remove Ply.Temp.Error.DuplicateSpItems
