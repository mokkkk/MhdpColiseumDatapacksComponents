#> mhdp_core:_index.d
# @private

#> tag
# @within function mhdp_core:/**

## storage
#declare storage mhdp_core:game_data ゲームの処理用データを保持するstorage、あまり変化しないデータを入れる(Time、Phaseなど一部は変化する)
#declare storage mhdp_core:weapon_data 武器の処理用データを保持するstorage
#declare storage mhdp_core:monster_data モンスターの処理用データを保持するstorage
#declare storage mhdp_core:save_data マップデータの進行状況保存用のstorage
#declare storage mhdp_core:variable_data 可変データを保持するstorage、頻繁に変化するデータを入れる(プレイヤーの個別データなど)
#declare storage mhdp_core:temp 一時保存データを保持するstorage、原則毎tick消去する

## score_holder
# 基本処理用
    #declare score_holder #mhdp_core_timer 全般的な処理に使用するタイマー
    #declare score_holder #mhdp_core_loading_quest_id 現在受注しているクエストのID
    #declare score_holder #mhdp_core_pre_played_quest_id 前回受注したクエストのID
# クエスト処理用
    #declare score_holder #mhdp_quest_timer_max クエストの最大制限時間
    #declare score_holder #mhdp_quest_timer クエストの制限時間
    #declare score_holder #mhdp_quest_deathcount_max クエストの最大残り乙回数
    #declare score_holder #mhdp_quest_deathcount クエストの残り乙回数
# プレイヤー処理
    #declare score_holder #mhdp_player_uid_grobal プレイヤーへのUID付与用、UIDを付与する毎に1増やす
# モンスター処理
    #declare score_holder #mhdp_monster_uid_grobal モンスターへのUID付与用、UIDを付与する毎に1増やす
# 一時
    #declare score_holder #mhdp_temp_grobal 一時的に使用する共通のスコア、必ず同function内でリセットする
    #declare score_holder #mhdp_temp_loading_player_uid 現在mhdp_core:temp PlayerDataに読み込まれているプレイヤーのUID
    #declare score_holder #mhdp_temp_page_normal クエスト受注書のページ管理に使用
    #declare score_holder #mhdp_temp_page_hard クエスト受注書のページ管理に使用
    #declare score_holder #mhdp_temp_page_extra クエスト受注書のページ管理に使用
# 定数
    #declare score_holder #const_20
    #declare score_holder #const_60
    #declare score_holder #const_100

## tag
# プレイヤー
    # 状態
        #declare tag Ply.State.HasUid Uid割り当て済
        #declare tag Ply.State.UsingWeapon 武器使用可能な状態
        #declare tag Ply.State.QuestHost クエスト受注主
        #declare tag Ply.State.QuestMember クエスト参加者
        #declare tag Ply.State.PlayingQuest クエスト中
        #declare tag Ply.State.MnsTarget モンスターのターゲットになりうる状態、闘技場戦闘フィールドでのみ有効
        #declare tag Ply.State.EnableDamage ダメージを受ける状態、クエスト中のみ有効、クエスト成功/失敗時に剥奪する
    # 操作
        # スニーク
            #declare tag Ply.Ope.IsSneaking スニーク中
            #declare tag Ply.Ope.StartSneak スニーク開始
            #declare tag Ply.Ope.StartDoubleSneak 連続スニーク
        # エンダーアイ
            #declare tag Ply.Ope.StartUsingEnderEye エンダーアイ使用開始
            #declare tag Ply.Ope.IsUsingEnderEye エンダーアイ使用中
            #declare tag Ply.Ope.EndUsingEnderEye エンダーアイ使用終了
            #declare tag Ply.Ope.UsedEnderEye.Short エンダーアイ短クリック
            #declare tag Ply.Ope.UsedEnderEye.Long エンダーアイ長クリック
            #declare tag Ply.Ope.StartUsingEnderEye.NotSneak エンダーアイ・非スニーク同時押し
            #declare tag Ply.Ope.StartUsingEnderEye.WithSneak エンダーアイ・スニーク同時押し
        # ジャンプ
            #declare tag Ply.Ope.StartJump ジャンプ開始
    # クエスト中処理
        #declare tag Ply.Event.DeathAnimation 死亡演出
    # 進捗
        #declare tag Ply.Adv.Using.EnderEye エンダーアイ使用
        #declare tag Ply.Adv.Hurt.EntityHurtPlayer 被ダメージ
        #declare tag Ply.Adv.Hurt.PlayerHurtEntity 与ダメージ
    # スキル
        # 食事スキル
            #declare tag Ply.Skill.Food.Insurance ネコの生命保険
    # 一時
        #declare tag Ply.Temp.Target 特定のプレイヤーを一時的に特定したいときに使用、必ず同function内でリセットする
        #declare tag Ply.Temp.IsGetData 現tickデータ取得済み
# マーカー
    # 処理用
        #declare tag Mk.Field.Center フィールドの中心に設置されるマーカー
        #declare tag Mk.Field.Back 壁に埋まった際、戻る位置決定用のマーカー
        #declare tag Mk.Ply.DeathAnimation プレイヤー死亡演出用のbarrierを取り除くための位置保存用マーカー
# その他
    # interaction
        #declare tag Other.Interaction.UI UI用interactionの共通タグ
        #declare tag Other.Interaction.Bell クエスト出発ベル用のinteraction
    # text_display
        #declare tag Other.Text.Bell クエスト出発ベルの説明文
    # 一時
        #declare tag Other.Temp.Right 左右確認に一時的に使用、必ず同function内でリセットする
