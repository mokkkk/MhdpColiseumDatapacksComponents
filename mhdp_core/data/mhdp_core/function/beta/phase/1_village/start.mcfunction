#> mhdp_core:beta/phase/1_village/start
#
# ベータ版処理 村開始時
#
# @within function mhdp_core:phase/1_village/change_phase/check

# チュートリアルクリア
    execute if data storage mhdp_core:save_data Flag{BetaTutorial:false} if data storage mhdp_core:game_data QuestList[{ID:1}].State{IsCleared:true} run function mhdp_core:beta/phase/1_village/update_flag/1_tutorial_clear
    execute if data storage mhdp_core:save_data Flag{BetaTutorial:false} if data storage mhdp_core:game_data QuestList[{ID:2}].State{IsCleared:true} run function mhdp_core:beta/phase/1_village/update_flag/1_tutorial_clear

# モンスター情報更新
    setblock -87 69 777 air replace
    setblock -87 69 775 air replace
    setblock -87 69 773 air replace
    setblock -87 69 771 air replace
    execute if data storage mhdp_core:game_data QuestList[{ID:1}].State{IsPlayed:true} run setblock -87 69 777 lectern[facing=east,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:['[{"text":"\\n\\uE011","font":"icons/mhdp_icons","color":"white"},{"text":"\\n青鳥竜\\n\\n危険度：★1\\n\\n　頭部の大きな赤いトサカが特徴の中型モンスター。\\n小型の鳥竜たちのリーダーで、通常は群れで行動する。\\n今回出没した個体は、群れを形成する前の単独個体と思われる。","font":"default","color":"black"}]','{"text":"特徴：\\n　中型モンスターのため、他のモンスターに比べると戦闘能力は低い。\\n　しかし、鋭い爪と強靭な脚力には注意。体制を低くした後には飛びかかり攻撃を仕掛けてくるので、警戒した方が良い。\\n　怒り状態では、死角に回り込んで攻撃を仕掛けてくることがある。","hoverEvent":{"action":"show_text","value":[{"text":"","color":"black"}]}}']}}}} replace
    execute if data storage mhdp_core:game_data QuestList[{ID:2}].State{IsPlayed:true} run setblock -87 69 777 lectern[facing=east,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:['[{"text":"\\n\\uE011","font":"icons/mhdp_icons","color":"white"},{"text":"\\n青鳥竜\\n\\n危険度：★1\\n\\n　頭部の大きな赤いトサカが特徴の中型モンスター。\\n小型の鳥竜たちのリーダーで、通常は群れで行動する。\\n今回出没した個体は、群れを形成する前の単独個体と思われる。","font":"default","color":"black"}]','{"text":"特徴：\\n　中型モンスターのため、他のモンスターに比べると戦闘能力は低い。\\n　しかし、鋭い爪と強靭な脚力には注意。体制を低くした後には飛びかかり攻撃を仕掛けてくるので、警戒した方が良い。\\n　怒り状態では、死角に回り込んで攻撃を仕掛けてくることがある。","hoverEvent":{"action":"show_text","value":[{"text":"","color":"black"}]}}']}}}} replace
    execute if data storage mhdp_core:game_data QuestList[{ID:11}].State{IsPlayed:true} run setblock -87 69 775 lectern[facing=east,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:['[{"text":"\\n\\uE012","font":"icons/mhdp_icons","color":"white","hoverEvent":{"action":"show_text","value":[{"text":"","color":"black"}]}},{"text":"\\n火竜\\n\\n危険度：★5\\n\\n　赤い体と大きな翼が特徴の飛竜種。別名『空の王者』と呼ばれるほど飛行能力が高く、その機動力と爪、火炎ブレスを活かして狩りを行う。","font":"default","color":"black"}]','{"text":"特徴：\\n　非常に獰猛で、積極的に攻撃を仕掛けてくる。\\n　特に、空を飛んだ状態の火竜は危険。王者の名に恥じぬ猛攻を見せるので、回避に徹するのが良いだろう。\\n　半面、地上に降りた際がチャンスのため、弱点の頭を中心に攻撃を仕掛けよう。","hoverEvent":{"action":"show_text","value":[{"text":"","color":"black"}]}}']}}}} replace
    execute if data storage mhdp_core:game_data QuestList[{ID:12}].State{IsPlayed:true} run setblock -87 69 773 lectern[facing=east,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:['[{"text":"\\n\\uE013","font":"icons/mhdp_icons","color":"white","hoverEvent":{"action":"show_text","value":[{"text":"","color":"black"}]}},{"text":"\\n斬竜\\n\\n危険度：★5\\n\\n　全長の半分を超える巨大な尾を持つ獣竜。尾は金属でできており、熱を帯びた際には高い斬れ味を誇る。\\n　その戦い方から、『灼熱の刃』と呼ばれる。","font":"default","color":"black"}]','{"text":"特徴：\\n　尻尾を用いた攻撃は破壊力抜群で、特に赤熱時の攻撃力が高い。尻尾の構えかたを見て、回避方向を決めよう。\\n　尻尾に噛みついた後に放つ回転斬りは非常に危険。すぐに離れた方が良いだろう。\\n　ただし、赤熱時の尻尾は柔らかいため、大きなダメージを与えられる。","hoverEvent":{"action":"show_text","value":[{"text":"","color":"black"}]}}','{"text":"　尻尾を研ぐような動作を見せた後は、喉を赤熱化させ、ブレスや噛みつきを中心に攻めてくる。\\n　この時は頭部が弱点となり、上手く隙を見つけて攻撃し続けると、ブレスが暴発し、大きな隙を晒すことがある。\\n　尻尾と喉の状態を見て、戦い方を変えると良いだろう。","hoverEvent":{"action":"show_text","value":[{"text":"","color":"black"}]}}']}}}} replace
    execute if data storage mhdp_core:game_data QuestList[{ID:13}].State{IsPlayed:true} run setblock -87 69 771 lectern[facing=east,has_book=true]{Book:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:"",pages:['[{"text":"\\n\\uE014","font":"icons/mhdp_icons","color":"white","hoverEvent":{"action":"show_text","value":[{"text":"","color":"black"}]}},{"text":"\\n天彗龍\\n\\n危険度：★6\\n\\n　高空域に住むとされる伝説の古龍。\\n　翼から龍気と呼ばれる赤いエネルギーを放出することで、音速で空を飛ぶとされる。","font":"default","color":"black"}]','{"text":"特徴：\\n　天彗龍は、翼の向きによって戦い方を変える。\\n　翼を前に構える『彗龍』形態では、翼を槍のように使って攻撃する。そのため、少し距離を取ると攻撃が避けやすい。\\n　翼を広げ、逆向きに構える『龍気』形態では、遠距離への射撃や広範囲への攻撃を行う。あえて天彗龍に近づくことで、攻撃が避けやすくなる。","hoverEvent":{"action":"show_text","value":[{"text":"","color":"black"}]}}','{"text":"　天彗龍の攻撃はどれも危険だが、特に高高度から仕掛けてくる急降下攻撃は、圧倒的な攻撃力を持つ。天彗龍の動きをよく見て、垂直に移動すると避けられるだろう。\\n　怒り状態が終わると、思い切り息を吸い込む龍気吸引と呼ばれる行動を取ることがある。この時、胸に攻撃を集中すると、龍気を爆発させて怯ませることができるかもしれない。","hoverEvent":{"action":"show_text","value":[{"text":"","color":"black"}]}}']}}}} replace

# 高難度クエスト解放
    execute if data storage mhdp_core:save_data Flag{BetaReusHard:false} if data storage mhdp_core:game_data QuestList[{ID:11}].State{IsCleared:true} run function mhdp_core:beta/phase/1_village/update_flag/2_reus_clear
    execute if data storage mhdp_core:save_data Flag{BetaDinoHard:false} if data storage mhdp_core:game_data QuestList[{ID:12}].State{IsCleared:true} run function mhdp_core:beta/phase/1_village/update_flag/3_dino_clear
    execute if data storage mhdp_core:save_data Flag{BetaValkHard:false} if data storage mhdp_core:game_data QuestList[{ID:13}].State{IsCleared:true} run function mhdp_core:beta/phase/1_village/update_flag/4_valk_clear

# 全クエストクリア
    execute if data storage mhdp_core:save_data Flag{BetaComplete:false} \
        if data storage mhdp_core:game_data QuestList[{ID:14}].State{IsCleared:true} \
        if data storage mhdp_core:game_data QuestList[{ID:15}].State{IsCleared:true} \
        if data storage mhdp_core:game_data QuestList[{ID:16}].State{IsCleared:true} \
        if data storage mhdp_core:game_data QuestList[{ID:17}].State{IsCleared:true} \
        run function mhdp_core:beta/phase/1_village/update_flag/5_complete

# 武器UIの設置
    function mhdp_core:beta/phase/1_village/select_weapon/summon
