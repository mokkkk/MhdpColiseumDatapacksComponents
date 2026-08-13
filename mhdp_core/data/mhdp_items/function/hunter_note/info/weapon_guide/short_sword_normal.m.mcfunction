#> mhdp_items:hunter_note/info/weapon_guide/short_sword_normal.m
#
# ハンターノート操作 武器操作説明 片手剣 地ノ型
#
# @within function mhdp_core:player/tick

# 表示
    $return run dialog show @s {\
        type:"minecraft:notice",title:{translate:"ui.hunter_note.weapon_guide.short_sword.normal",bold:1b},can_close_with_escape:1b,inputs:[],body:[\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff",bold:true},{translate:"weapon.short_sword.guide.normal_attack"}," : ",{keybind:"key.attack"},"\n"],\
                [{text:"・",color:"#afafaf",bold:false},{translate:"weapon.short_sword.action.normal_1"}," > ",{translate:"weapon.short_sword.action.normal_2"}," > ",{translate:"weapon.short_sword.action.normal_3"}]\
            ],width:300},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff",bold:true},{translate:"weapon.short_sword.guide.sword_combo"}," : ",{keybind:"key.use"},"\n"],\
                [{text:"・",color:"#afafaf",bold:false},{translate:"weapon.short_sword.action.sword_combo_1"}," > ",{translate:"weapon.short_sword.action.sword_combo_2"}," > ",{translate:"weapon.short_sword.action.sword_combo_3"}," > ",{translate:"weapon.short_sword.action.sword_combo_4"}," > ",{translate:"weapon.short_sword.action.sword_combo_5"}]\
            ],width:300},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff",bold:true},{translate:"weapon.short_sword.action.guard"}," : ",{keybind:"key.sneak"}],\
            ],width:300},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff",bold:true},{translate:"weapon.short_sword.guide.charge"}," : ",{translate:"operation.while",with:[{translate:"weapon.short_sword.action.guard"},{translate:"operation.long",with:[{keybind:"key.use"}]}]},{text:"\uE001",font:"icons/book",hover_event:{action:"show_text",value:{translate:"weapon.short_sword.guide.charge.detail",with:[{keybind:"key.use"}]}}},"\n"],\
                [{text:"・",color:"#afafaf",bold:false},{translate:"weapon.short_sword.action.guard"}," > ",{translate:"weapon.short_sword.action.charge"}," > ",{translate:"weapon.short_sword.action.spin"},"\n"],\
                [{text:"・",color:"#afafaf",bold:false},{translate:"weapon.short_sword.action.guard"}," > ",{translate:"weapon.short_sword.action.charge"}," > ",{translate:"weapon.short_sword.action.rush_combo"}]\
            ],width:300},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff",bold:true},{translate:"operation.air",with:[{translate:"weapon.short_sword.action.falling_spear"}]}," : ",{translate:"operation.air_key",with:[{keybind:"key.use"}]}],\
            ],width:300},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff",bold:true},{translate:"operation.sp_air",with:[{translate:"weapon.short_sword.action.falling_shadow"}]}," : ",{translate:"operation.sp_air_key",with:[{keybind:"key.use"}]},{text:"\uE001",font:"icons/book",hover_event:{action:"show_text",value:{translate:"weapon.short_sword.guide.falling_shadow.detail",with:[{keybind:"key.use"}]}}},"\n"],\
                [{text:"・",color:"#afafaf",bold:false},{translate:"weapon.short_sword.action.falling_shadow"}," > ",{translate:"weapon.short_sword.action.rising_slash"}," > ",{translate:"weapon.short_sword.action.fallbash_high"}]\
            ],width:300},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff",bold:true},{translate:"operation.arts1",with:[{translate:"weapon.short_sword.action.blade_dance"}]}," : ",{translate:"operation.arts_key",with:[{keybind:"key.sneak"},{keybind:"key.sprint"},{keybind:"key.attack"}]},{text:"\uE001",font:"icons/book",hover_event:{action:"show_text",value:{translate:"weapon.short_sword.guide.blade_dance.detail",with:[{keybind:"key.use"}]}}}],\
            ],width:300},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff",bold:true},{translate:"operation.arts2",with:[{translate:"weapon.short_sword.action.metsu_shoryugeki"}]}," : ",{translate:"operation.arts_key",with:[{keybind:"key.sneak"},{keybind:"key.sprint"},{keybind:"key.use"}]},{text:"\uE001",font:"icons/book",hover_event:{action:"show_text",value:{translate:"weapon.short_sword.guide.metsu_shoryugeki.detail",with:[{keybind:"key.use"}]}}}],\
            ],width:300}\
        ],\
        action:{label:{translate:"ui.hunter_note.button_close"},action:{type:"minecraft:run_command",command:"trigger $(Trigger) set $(Value)"}}\
    }

# 保持
    dialog show @s {\
        type:"minecraft:notice",title:{translate:"ui.hunter_note.weapon_guide.short_sword.normal",bold:1b},can_close_with_escape:1b,inputs:[],body:[\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff",bold:true},{translate:"weapon.short_sword.guide.normal_attack"}," : ",{keybind:"key.attack"},"\n"],\
                [{text:"・",color:"#afafaf",bold:false},{translate:"weapon.short_sword.action.normal_1"}," > ",{translate:"weapon.short_sword.action.normal_2"}," > ",{translate:"weapon.short_sword.action.normal_3"}]\
            ],width:300},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff",bold:true},{translate:"weapon.short_sword.guide.sword_combo"}," : ",{keybind:"key.use"},"\n"],\
                [{text:"・",color:"#afafaf",bold:false},{translate:"weapon.short_sword.action.sword_combo_1"}," > ",{translate:"weapon.short_sword.action.sword_combo_2"}," > ",{translate:"weapon.short_sword.action.sword_combo_3"}," > ",{translate:"weapon.short_sword.action.sword_combo_4"}," > ",{translate:"weapon.short_sword.action.sword_combo_5"}]\
            ],width:300},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff",bold:true},{translate:"weapon.short_sword.action.guard"}," : ",{keybind:"key.sneak"}],\
            ],width:300},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff",bold:true},{translate:"weapon.short_sword.guide.charge"}," : ",{translate:"operation.while",with:[{translate:"weapon.short_sword.action.guard"},{translate:"operation.long",with:[{keybind:"key.use"}]}]},{text:"\uE001",font:"icons/book",hover_event:{action:"show_text",value:{translate:"weapon.short_sword.guide.charge.detail",with:[{keybind:"key.use"}]}}},"\n"],\
                [{text:"・",color:"#afafaf",bold:false},{translate:"weapon.short_sword.action.guard"}," > ",{translate:"weapon.short_sword.action.charge"}," > ",{translate:"weapon.short_sword.action.spin"},"\n"],\
                [{text:"・",color:"#afafaf",bold:false},{translate:"weapon.short_sword.action.guard"}," > ",{translate:"weapon.short_sword.action.charge"}," > ",{translate:"weapon.short_sword.action.rush_combo"}]\
            ],width:300},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff",bold:true},{translate:"operation.air",with:[{translate:"weapon.short_sword.action.falling_spear"}]}," : ",{translate:"operation.air_key",with:[{keybind:"key.use"}]}],\
            ],width:300},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff",bold:true},{translate:"operation.sp_air",with:[{translate:"weapon.short_sword.action.falling_shadow"}]}," : ",{translate:"operation.sp_air_key",with:[{keybind:"key.use"}]},{text:"\uE001",font:"icons/book",hover_event:{action:"show_text",value:{translate:"weapon.short_sword.guide.falling_shadow.detail",with:[{keybind:"key.use"}]}}},"\n"],\
                [{text:"・",color:"#afafaf",bold:false},{translate:"weapon.short_sword.action.falling_shadow"}," > ",{translate:"weapon.short_sword.action.rising_slash"}," > ",{translate:"weapon.short_sword.action.fallbash_high"}]\
            ],width:300},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff",bold:true},{translate:"operation.arts1",with:[{translate:"weapon.short_sword.action.blade_dance"}]}," : ",{translate:"operation.arts_key",with:[{keybind:"key.sneak"},{keybind:"key.sprint"},{keybind:"key.attack"}]},{text:"\uE001",font:"icons/book",hover_event:{action:"show_text",value:{translate:"weapon.short_sword.guide.blade_dance.detail",with:[{keybind:"key.use"}]}}}],\
            ],width:300},\
            {type:"minecraft:plain_message",contents:[\
                [{text:"◇ ",color:"#ffffff",bold:true},{translate:"operation.arts2",with:[{translate:"weapon.short_sword.action.metsu_shoryugeki"}]}," : ",{translate:"operation.arts_key",with:[{keybind:"key.sneak"},{keybind:"key.sprint"},{keybind:"key.use"}]},{text:"\uE001",font:"icons/book",hover_event:{action:"show_text",value:{translate:"weapon.short_sword.guide.metsu_shoryugeki.detail",with:[{keybind:"key.use"}]}}}],\
            ],width:300}\
        ],\
        action:{label:{translate:"ui.hunter_note.button_close"},action:{type:"minecraft:run_command",command:"trigger A set 1"}}\
    }
