#> mhdp_core:_index.d
# @private

#> tag
# @within function **

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
    #declare score_holder #mhdp_core_quest_serial_id 前回受注したクエストの連番ID
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
        #declare tag Ply.State.IsSilent 演出による無音状態
        #declare tag Ply.State.IsRetire クエストリタイア済み
        #declare tag Ply.State.IsTraining 訓練所利用中
        #declare tag Ply.State.IsUsedGuts 根性発動済み
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
            #declare tag Ply.Ope.DroppedEnderEye エンダーアイ投げ捨て
        # ニンジン棒
            #declare tag Ply.Ope.StartUsingCoas ニンジン棒使用
            #declare tag Ply.Ope.DroppedCoas ニンジン棒投げ捨て
        # ジャンプ
            #declare tag Ply.Ope.StartKeyJump ジャンプ開始
            #declare tag Ply.Ope.StartDoubleJump 連続ジャンプ
        # ダッシュ
            #declare tag Ply.Ope.IsSprinting ダッシュ中
        # 空中
            #declare tag Ply.Ope.IsAir 飛行中
        # キー入力
            #declare tag Ply.Ope.StartKeyForward
            #declare tag Ply.Ope.IsKeyForward
            #declare tag Ply.Ope.StartKeyLeft
            #declare tag Ply.Ope.IsKeyLeft
            #declare tag Ply.Ope.StartKeyBack
            #declare tag Ply.Ope.IsKeyBack
            #declare tag Ply.Ope.StartKeyRight
            #declare tag Ply.Ope.IsKeyRight
            #declare tag Ply.Ope.StartKeyJump
            #declare tag Ply.Ope.IsKeyJump
            #declare tag Ply.Ope.StartKeySprint
            #declare tag Ply.Ope.IsKeySprint
            #declare tag Ply.Ope.StartKeySneak
            #declare tag Ply.Ope.IsKeySneak
        # 先行入力
            #declare tag Ply.Ope.Buffering.A 先行入力A
            #declare tag Ply.Ope.Buffering.B 先行入力B
            #declare tag Ply.Ope.Buffering.C 先行入力C
            #declare tag Ply.Ope.Buffering.D 先行入力D
    # クエスト中処理
        #declare tag Ply.Event.DeathAnimation 死亡演出
    # 進捗
        #declare tag Ply.Adv.Using.EnderEye エンダーアイ使用
        #declare tag Ply.Adv.Using.Paper 紙使用
        #declare tag Ply.Adv.Hurt.EntityHurtPlayer 被ダメージ
        #declare tag Ply.Adv.Hurt.PlayerHurtEntity 与ダメージ
    # 一時
        #declare tag Ply.Temp.Target 特定のプレイヤーを一時的に特定したいときに使用、必ず同function内でリセットする
        #declare tag Ply.Temp.TargetSub 上記では足りないときに利用、注意事項は同じ
        #declare tag Ply.Temp.IsGetData 現tickデータ取得済み
        #declare tag Ply.Temp.IsCounterDamage 相殺判定ダメージ
        #declare tag Ply.Temp.IsCrit 会心発生時
        #declare tag Ply.Temp.IsCritInverse 逆会心発生時
        #declare tag Ply.Temp.IsDisableConditionDamage 状態異常無効時
        #declare tag Ply.Temp.DoKnockback ノックバックを適用する
        # クエスト出発時エラー関連
            #declare tag Ply.Temp.Error.Gamemode ゲームモードに関するエラー
            #declare tag Ply.Temp.Error.HasCursorItem カーソルにアイテムを保持しているエラー
            #declare tag Ply.Temp.Error.HasNotWeapons 武器を持っていないエラー
            #declare tag Ply.Temp.Error.HasManyWeapons 武器を2つ以上持っているエラー
            #declare tag Ply.Temp.Error.HasNotWeaponOffhand オフハンドに武器を持っていないエラー
            #declare tag Ply.Temp.Error.HasManySpItems 特殊装具を3つ以上持っているエラー
            #declare tag Ply.Temp.Error.DuplicateSpItems 同じ種類の特殊装具を2つ以上持っているエラー
    # チュートリアル
        #declare tag Ply.Temp.Tutorial.DrawAttack 抜刀攻撃チュートリアル
        #declare tag Ply.Temp.Tutorial.Avoid 回避チュートリアル
        #declare tag Ply.Temp.Tutorial.Guard ガードチュートリアル
        #declare tag Ply.Temp.Tutorial.CritShot クリティカル距離チュートリアル
# 村人
    # 処理用
        #declare tag Vlg.Root 村人の共通タグ
    # 村人
        # 村チュートリアル
            #declare tag Vlg.VillageTutorial 村チュートリアル再生用
        # 武器チュートリアル
            #declare tag Vlg.WeaponTutorial 武器チュートリアル再生用
            #declare tag Vlg.WeaponTutorial.TargetPlayer 武器チュートリアルの対象プレイヤー
            #declare tag Vlg.WeaponTutorial.ShortSword.Normal 片手剣・地ノ型
            #declare tag Vlg.WeaponTutorial.ShortSword.Tec 片手剣・天ノ型
            #declare tag Vlg.WeaponTutorial.GreatSword.Normal 大剣・地ノ型
            #declare tag Vlg.WeaponTutorial.GreatSword.Tec 大剣・天ノ型
            #declare tag Vlg.WeaponTutorial.Bow.Normal 弓・地ノ型
            #declare tag Vlg.WeaponTutorial.Bow.Tec 弓・天ノ型
# マーカー
    # 処理用
        #declare tag Mk.Field.Center フィールドの中心に設置されるマーカー
        #declare tag Mk.Field.Back 壁に埋まった際、戻る位置決定用のマーカー
        #declare tag Mk.Field.SummonPos モンスターの召喚位置決定用のマーカー
        #declare tag Mk.Ply.DeathAnimation プレイヤー死亡演出用のbarrierを取り除くための位置保存用マーカー
# その他
    # interaction
        #declare tag Other.Interaction.UI UI用interactionの共通タグ
        #declare tag Other.Interaction.Bell クエスト出発ベル用のinteraction
        #declare tag Other.Interaction.Board クエスト参加用クエストボードのinteraction
        #declare tag Other.Interaction.RetireBell クエストリタイアベル用のinteraction
    # text_display
        #declare tag Other.Text.Bell クエスト出発ベルの説明文
        #declare tag Other.Text.Board クエスト参加用クエストボードの説明文
        #declare tag Other.Text.Damage ダメージ表示
        #declare tag Other.Text.Vfx エフェクト表示用共通のテキストディスプレイ
        #declare tag Other.Text.Vfx.Strong エフェクト表示・強撃
        #declare tag Other.Text.Vfx.Slash 斬撃エフェクト
        #declare tag Other.Text.Tutorial チュートリアル再生用のテキスト
    # 一時
        #declare tag Other.Temp.Right 左右確認に一時的に使用、必ず同function内でリセットする
    # 射撃
        #declare tag Other.Shot 射撃Entityの共通タグ
# 体験版用
    # player
        #declare tag Beta.Ply.SelectedWeapon 武器選択済み
        #declare tag Beta.Ply.Weapon.GreatSword 大剣
        #declare tag Beta.Ply.Weapon.ShortSword 片手剣
    # interaction
        #declare tag Beta.Ui
        #declare tag Beta.Interaction.Ss.Normal 片手剣地の型
        #declare tag Beta.Interaction.Ss.Tec 片手剣天の型
