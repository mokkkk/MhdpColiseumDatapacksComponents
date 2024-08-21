#> mhdp_core:phase/1_village/change_phase/show_error
#
# 次Phaseへ遷移できるか確認する
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 共通表示
    execute unless entity @a[tag=Ply.State.QuestMember] run tellraw @a[tag=Ply.Temp.Target] {"text":"【ERROR!:クエスト出発条件を満たしていません。以下をご確認ください。】","color": "red"}
    execute if entity @a[tag=Ply.State.QuestMember] run tellraw @a[tag=Ply.Temp.Target] {"text":"【ERROR!:クエスト出発条件を満たしていません。以下をご確認ください。】","color": "red"}

# エラー内容に応じた表示
    # クエスト未受注、QuestMemberがいないためクリック者にのみ表示
        execute if data storage mhdp_core:temp Errors{IsNotQuestOrdered:true} run tellraw @a[tag=Ply.Temp.Target] {"text":" - 【クエストが受注されていません】","color": "red"}
    # クエスト存在チェック
        execute if data storage mhdp_core:temp Errors{IsQuestNotExist:true} run tellraw @a[tag=Ply.State.QuestMember] {"text":" - 【対象のクエストは存在しません】","color": "red"}

# プレイヤー関連のエラー内容に応じた表示
    # 体験版：武器を選択していない
        execute if entity @a[tag=Ply.Temp.Error.BetaNotSelectedWeapon] run tellraw @a[tag=Ply.Temp.Error.BetaNotSelectedWeapon] [{"text":" - 【使用する武器を選択してください】\n 対象：","color": "red"},{"selector":"@a[tag=Ply.Temp.Error.BetaNotSelectedWeapon]","color": "red"}]
    # ゲームモード
        execute if entity @a[tag=Ply.Temp.Error.Gamemode] run tellraw @a[tag=Ply.State.QuestMember] [{"text":" - 【ゲームモードをアドベンチャーに設定してください】\n 対象：","color": "red"},{"selector":"@a[tag=Ply.Temp.Error.Gamemode]","color": "red"}]
    # カーソルにアイテムを保持している
        execute if entity @a[tag=Ply.Temp.Error.HasCursorItem] run tellraw @a[tag=Ply.State.QuestMember] [{"text":" - 【カーソルにアイテムを持たないでください】\n 対象：","color": "red"},{"selector":"@a[tag=Ply.Temp.Error.HasCursorItem]","color": "red"}]
    # 武器を持っていない
        execute if entity @a[tag=Ply.Temp.Error.HasNotWeapons] run tellraw @a[tag=Ply.State.QuestMember] [{"text":" - 【武器を所持してください】\n 対象：","color": "red"},{"selector":"@a[tag=Ply.Temp.Error.HasNotWeapons]","color": "red"}]
    # 武器を2つ以上持っている
        execute if entity @a[tag=Ply.Temp.Error.HasManyWeapons] run tellraw @a[tag=Ply.State.QuestMember] [{"text":" - 【武器は1つまでしか所持できません】\n 対象：","color": "red"},{"selector":"@a[tag=Ply.Temp.Error.HasManyWeapons]","color": "red"}]
    # 武器をオフハンドにセットしていない
        execute if entity @a[tag=Ply.Temp.Error.HasNotWeaponOffhand] run tellraw @a[tag=Ply.State.QuestMember] [{"text":" - 【武器はオフハンドに所持してください】\n 対象：","color": "red"},{"selector":"@a[tag=Ply.Temp.Error.HasNotWeaponOffhand]","color": "red"}]
    # 特殊装具を3つ以上持っている
        execute if entity @a[tag=Ply.Temp.Error.HasManySpItems] run tellraw @a[tag=Ply.State.QuestMember] [{"text":" - 【特殊装具は2つまでしか所持できません】\n 対象：","color": "red"},{"selector":"@a[tag=Ply.Temp.Error.HasManySpItems]","color": "red"}]
    # 同じ特殊装具を2つ以上持っている
        execute if entity @a[tag=Ply.Temp.Error.DuplicateSpItems] run tellraw @a[tag=Ply.State.QuestMember] [{"text":" - 【同じ種類の特殊装具は1つまでしか所持できません】\n 対象：","color": "red"},{"selector":"@a[tag=Ply.Temp.Error.DuplicateSpItems]","color": "red"}]

# 終了
    tag @a remove Ply.Temp.Error.BetaNotSelectedWeapon
    tag @a remove Ply.Temp.Error.Gamemode
    tag @a remove Ply.Temp.Error.HasCursorItem
    tag @a remove Ply.Temp.Error.HasNotWeapons
    tag @a remove Ply.Temp.Error.HasManyWeapons
    tag @a remove Ply.Temp.Error.HasNotWeaponOffhand
    tag @a remove Ply.Temp.Error.HasManySpItems
    tag @a remove Ply.Temp.Error.DuplicateSpItems
