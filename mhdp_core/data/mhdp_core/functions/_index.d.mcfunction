#> mhdp_core:_index.d
# @private

#> tag
# @within function mhdp_core:/**

## storage
#declare storage mhdp_core:game_data ゲームの処理用データを保持するstorage
#declare storage mhdp_core:weapon_data 武器の処理用データを保持するstorage
#declare storage mhdp_core:monster_data モンスターの処理用データを保持するstorage
#declare storage mhdp_core:save_data マップデータの進行状況保存用のstorage
#declare storage mhdp_core:variable_data 可変データを保持するstorage
#declare storage mhdp_core:temp 一時保存データを保持するstorage、原則毎tick消去する

## score_holder
# プレイヤー処理
    #declare score_holder #mhdp_player_uid_grobal プレイヤーへのUID付与用、UIDを付与する毎に1増やす
# モンスター処理
    #declare score_holder #mhdp_monster_uid_grobal モンスターへのUID付与用、UIDを付与する毎に1増やす
# 一時
    #declare score_holder #mhdp_temp_grobal 一時的に使用する共通のスコア、必ず同function内でリセットする

## tag
# プレイヤー処理
    # 状態
        #declare tag Ply.State.HasUid Uid割り当て済
        #declare tag Ply.State.UsingWeapon 武器使用可能な状態
        #declare tag Ply.State.QuestHost クエスト受注主
        #declare tag Ply.State.QuestMember クエスト参加者
        #declare tag Ply.State.PlayingQuest クエスト中
        #declare tag Ply.State.MnsTarget モンスターのターゲットになりうる状態、闘技場戦闘フィールドでのみ有効
        #declare tag Ply.State.EnableDamage ダメージを受ける状態、クエスト中のみ有効、クエスト成功/失敗時に剥奪する
    # 一時
        #declare tag Ply.Temp.IsGetData データ取得済み
