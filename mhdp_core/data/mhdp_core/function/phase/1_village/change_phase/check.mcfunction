#> mhdp_core:phase/1_village/change_phase/check
#
# 次Phaseへ遷移できるか確認する
#
# @within function mhdp_core:phase/1_village/bell/click

# 条件確認
    data modify storage mhdp_core:temp IsError set value false
    # クエストの受注確認
        function mhdp_core:phase/1_village/change_phase/check_quest
    # ベータ版用処理
        execute if data storage mhdp_core:temp {IsError:false} if data storage mhdp_core:game_data {IsBetaVersion:true} as @a[tag=Ply.State.QuestMember] run function mhdp_core:beta/phase/1_village/check_player_beta
        # 武器の装備処理
        # この後武器の装備チェックが行われるため、このタイミングで装備する
            execute if data storage mhdp_core:temp {IsError:false} as @a[tag=Ply.State.QuestMember] run function mhdp_core:beta/phase/1_village/equip_weapon
    # プレイヤーの状態確認
        execute if data storage mhdp_core:temp {IsError:false} as @a[tag=Ply.State.QuestMember] run function mhdp_core:phase/1_village/change_phase/check_player
    
# エラーがある場合、エラー内容を表示
    execute if data storage mhdp_core:temp {IsError:true} run function mhdp_core:phase/1_village/change_phase/show_error

# フェーズ変更
    execute if data storage mhdp_core:temp {IsError:false} run function mhdp_core:phase/1_village/change_phase/change

# 終了
    data remove storage mhdp_core:temp IsError
    data remove storage mhdp_core:temp Errors
