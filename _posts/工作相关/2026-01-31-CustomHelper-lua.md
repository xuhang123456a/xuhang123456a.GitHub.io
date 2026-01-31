---
layout: post
title: CustomHelper-lua
categories: [工作]
date: 2026-01-31
---

# CustomHelper.lua

-- 如果模块modname加载过，则重新加载

function reload_ex(modname)

    print(string.format("[MyApp] reload_ex = %s", modname))

    return require_ex(modname)

end

-- 去除加载模块modname

function un_register(modname)

    print(string.format("[MyApp] un_register = %s", modname))

    package.loaded[modname] = nil

end

-- call Java method

function callJava(cls, method, sign, ...)

    -- print("class---------->", cls)

    -- print("method------->", method)

    local javaParams = clone({...})

    -- dump(javaParams, "javaParams-------------->")

    luaj.callStaticMethod(cls, method, javaParams, sign)

end

---call OC method

function callObjectC(cls, method, param, callback)

    -- print("call Object-C:", cls, method, param)

    local ok, ret = luaoc.callStaticMethod(cls, method, param)

    -- print("call result------->", ok, ret)

    if ok and callback ~= nil then callback(ret) end

end

function writefile(fileName, content, mode)

    fileName = fileName or "superstar_file"

    content = content or ""

    mode = mode or "w+b"

    local path = APP_DIR .. fileName

    -- if io.exists(path) then

        return io.writefile(path, content, mode)

    -- end

end

function readfile(fileName)

    fileName = fileName or "tank_file"

    local path = APP_DIR .. fileName

    if io.exists(path) then

        return io.readfile(path)

    end

end

function removeFile(fileName)

    io.writefile(fileName, "")

    if device.platform == "windows" then

        os.remove(string.gsub(fileName, '/', '\\'))

    else

        os.remove(fileName)

    end

end

function table.isexist(tbl, index)

    if not tbl then return false end

    

    local res = rawget(tbl , index)

    if res == nil then return false

    else return true end

end

-----数组乱序

function table.shuffle( arr )

    for i=#arr,1,-1 do

        local j = math.random(1,i)

        local t = arr[i]

        arr[i] = arr[j]

        arr[j] = t

    end

end

function table.isempty(tbl)

    if not tbl then return true end

    return _G.next(tbl) == nil

end

function table.subArray( array, nBeginIndex, nEndIndex )

   local arr = {}

   nBeginIndex = nBeginIndex or 1

   nEndIndex = nEndIndex or #array

   for i,v in ipairs(array) do

       if i >= nBeginIndex and i <= nEndIndex then

            arr[#arr+1] = v

       end

   end

   return arr

end

display = display or {}

display.TEXT_ALIGN_LEFT = cc.ui.TEXT_ALIGN_LEFT

display.TEXT_ALIGN_CENTER = cc.ui.TEXT_ALIGN_CENTER

display.TEXT_ALIGN_RIGHT = cc.ui.TEXT_ALIGN_RIGHT

display.TEXT_VALIGN_TOP = cc.ui.TEXT_VALIGN_TOP

display.TEXT_VALIGN_CENTER = cc.ui.TEXT_VALIGN_CENTER

display.TEXT_VALIGN_BOTTOM = cc.ui.TEXT_VALIGN_BOTTOM

FOREGROUND_BLUE            = 0x0001 -- // text color contains blue.

FOREGROUND_GREEN           = 0x0002 -- // text color contains green.

FOREGROUND_RED             = 0x0004 -- // text color contains red.

FOREGROUND_INTENSITY       = 0x0008 -- // text color is intensified.

BACKGROUND_BLUE            = 0x0010 -- // background color contains blue.

BACKGROUND_GREEN           = 0x0020 -- // background color contains green.

BACKGROUND_RED             = 0x0040 -- // background color contains red.

BACKGROUND_INTENSITY       = 0x0080 -- // background color is intensified.

COMMON_LVB_LEADING_BYTE    = 0x0100 -- // Leading Byte of DBCS

COMMON_LVB_TRAILING_BYTE   = 0x0200 -- // Trailing Byte of DBCS

COMMON_LVB_GRID_HORIZONTAL = 0x0400 -- // DBCS: Grid attribute: top horizontal.

COMMON_LVB_GRID_LVERTICAL  = 0x0800 -- // DBCS: Grid attribute: left vertical.

COMMON_LVB_GRID_RVERTICAL  = 0x1000 -- // DBCS: Grid attribute: right vertical.

COMMON_LVB_REVERSE_VIDEO   = 0x4000 -- // DBCS: Reverse fore/back ground attribute.

COMMON_LVB_UNDERSCORE      = 0x8000 -- // DBCS: Underscore.

COMMON_LVB_SBCSDBCS        = 0x0300 -- // SBCS or DBCS flag.

    -- cc.HelperFunc:setConsoleTextColor(bit.bit_or())

    -- cc.HelperFunc:setConsoleTextColor(BACKGROUND_RED)

function setDeugColor(color)

    color = color or bit.bor(bit.bor(FOREGROUND_BLUE, FOREGROUND_GREEN), FOREGROUND_RED)

    cc.HelperFunc:setConsoleTextColor(color)

end

function resetDegColor()

    cc.HelperFunc:setConsoleTextColor(bit.bor(bit.bor(FOREGROUND_BLUE, FOREGROUND_GREEN), FOREGROUND_RED))

end

local _error_ = __G__TRACKBACK__

function __G__TRACKBACK__(errorMessage)

    if GAME_PRINT_ENABLE then

        setDeugColor(FOREGROUND_RED)

        print("----------------------------------------")

        print("LUA ERROR: " .. tostring(errorMessage) .. "\n")

        print(debug.traceback("", 2))

        print("----------------------------------------")

        resetDegColor()

    else

        _error_(errorMessage)

    end

end

function gprint(...)

    if GAME_PRINT_ENABLE then

        -- setDeugColor(FOREGROUND_RED)

          print(...)

        -- resetDegColor()

    end

end

function gdump(...)

   if GAME_PRINT_ENABLE then dump(...) end

end

function ggprint(...)

    if GAME_PRINT_ENABLE then

        setDeugColor(FOREGROUND_GREEN)

          print(...)

        resetDegColor()

    end

end

function ggdump(...)

    if GAME_PRINT_ENABLE then

        setDeugColor(0x0003)

          dump(...)

        resetDegColor()

    end

end

-- node添加touch事件

function nodeTouchEventProtocol(node, cb, mode, capture, swallow)

    if not node then return end

    mode = mode or cc.TOUCH_MODE_ONE_BY_ONE -- 单点触摸

    swallow = swallow or false

    if capture == nil then capture = true end

    node:setTouchEnabled(true)

    node:setTouchMode(mode)

    node:setTouchCaptureEnabled(capture)

    node:setTouchSwallowEnabled(swallow)

    -- 添加触摸事件处理函数

    node:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)

        return cb(event)

    end)

end

----node添加 消息处理

function nodeExportComponentMethod(node)

    cc(node):addComponent("components.behavior.EventProtocol"):exportMethods()

end

function create_ui( jsonFile , params)

    local b = os.clock()

    local ui = cc.uiloader:load(jsonFile, params)

    local e = os.clock()

    gprint("elapsed time: ", string.format("%.2f", e-b), jsonFile)

    return ui

end

function release_ui()

    cc.uiloader:clearCache()

end

function preload_ui( jsonFile )

    cc.uiloader:preloadCache(jsonFile)

end

function set_ui_cache(cache)

    cc.uiloader:setReadCache(cache)

end

function get_ui_size(jsonFile)

    return cc.uiloader:getJsonSize(jsonFile)

end

function get_ui_node_pos( jsonFile, structPath )

    local path = string.split(structPath,"|")

    local json = cc.uiloader:loadFile_(jsonFile)

    local node = json.widgetTree

    local parentObj = nil

    local x,y = node.options.x, node.options.y

    for i,v in ipairs(path) do

        parentObj = node

        node = nil

        for __,obj in ipairs(parentObj.children or {}) do

            if obj.options and obj.options.name == v then

                node = obj

                x = x + node.options.x

                y = y + node.options.y

                break

            end

        end

        if node == nil then

            break

        end

    end

    

    if node then

        return true, x, y

    end

    return false

end

function findChildByName( parent, name )

    if not name or name == "" then

        return nil

    end

    if not parent then

        return nil

    end

    if not parent.subChildren then

        return nil

    end

    return parent.subChildren[name]

end

    

function find_( parent, name )

    if not parent or name == nil or name == "" then

        return nil

    end

    if name == parent.name then

        return parent

    end

    local findNode

    findNode = findChildByName(parent, name)

    if findNode then

        return findNode

    end

    for i,v in pairs(parent.subChildren) do

        findNode = find_(v, name)

        if findNode then

            return findNode

        end

    end

end

function findNodeByName( parentNode, childName )

    if not parentNode or not childName or childName == "" then

        return nil

    end

    return find_(parentNode, childName)

end

function isInRect( node, p )

    local rect = cc.rect(0,0,node:getContentSize().width, node:getContentSize().height)--node:getBoundingBox()

    local lPos = node:convertToNodeSpace(p)

    local ret = cc.rectContainsPoint(rect, lPos)        

    if ret and not G_NonReleaseTexture then

        if node.isInPixel_ and node.filename_ then

           -- ret = alphaCheck(node, p)

            if cc.HelperFunc.getImagePixel then

                local img = cc.Image:new()

                if img:initWithImageFile(node.filename_) then

                   local c = cc.HelperFunc:getImagePixel(img, lPos.x, lPos.y)

                   -- gprint("pixel", c.r, c.g, c.b, c.a)

                   

                   ret = c.a > 10

                end

            end

        end     

    end

    return ret

end

-- node添加touch事件

function add_click(node, cb, clickAct, swallow, pixelIn,notScale)

    if not node then

        print("error!!!!!!!, node is nil")

        return

    end

    local scale = 1

    local notScale = notScale

    if notScale == nil then

        --点击时是否放大

        notScale = true

    end

    if not clickAct then

        scale = 0.9

    else

        notScale = false

    end

    if swallow == nil then swallow = true end

    if pixelIn == nil then pixelIn = false end

    if not node.originalScale__ then

        node.originalScale__ = node:getScale()

    end

    node:setScale(node.originalScale__)

    scale = scale * node.originalScale__

    node.click_callback__ = cb

    node:setTouchEnabled(true)

    if node.touchListener__ then

        --print("click event has exist!!!")

        return

    end

    node.isInPixel_ = pixelIn

    node:setCascadeTouchEnabled(false)

    if not node.lastTagTime_ then

        node.lastTagTime_ = 0

    end

    -- 添加触摸事件处理函数

    local touchListener = node:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)

        if not node:isVisible() then return false end

        if event.name == "began" then

            node.startPos_ = cc.p(event.x, event.y)

            if isInRect(node, node.startPos_) then

                node.touchState__ = 1

                if notScale == true then

                    -- node:setScale(scale)

                    if node.scaleAct_ then

                        node:stopAction(node.scaleAct_)

                        node.scaleAct_ = nil

                    end

                    node.scaleAct_ = transition.scaleTo(node, {scale=checknumber(scale), time=0.02, onComplete=function (sender)

                        sender.scaleAct_ = nil

                    end})   

                end

            else

                node.touchState__ = 0

            end

            node.hasMoved_ = false

            return true

        elseif event.name == "moved" then

            node.touchState__ = 2

            node.curPos_ = cc.p(event.x, event.y)

            local distance = cc.pGetDistance(node.startPos_, node.curPos_)

            if distance > 20 then

                node.hasMoved_ = true

            end

        elseif event.name == "ended" then

            local curTime = socket.gettime()

            -- if notScale == true then

            --     -- node:setScale(node.originalScale__)

            --     transition.scaleTo(node, {scale=checknumber(node.originalScale__), time=0.08})                  

            -- end

            local state = node.touchState__

            node.touchState__ = nil

            node.endPos_ = cc.p(event.x, event.y)

          

            local hasClick = false

            if (not node.hasMoved_ and isInRect(node, cc.p(event.x, event.y))) or state == 1 then

                if node.lastTagTime_ == 0 or ( curTime - node.lastTagTime_ ) >=0.3 then

                    if notScale == true then

                        if node.scaleAct_ then

                            node:stopAction(node.scaleAct_)

                            node.scaleAct_ = nil

                        end

                        node.scaleAct_ = node:runAction(transition.sequence({cc.EaseQuarticActionOut:create(cc.ScaleTo:create(0.1, node.originalScale__*1.02, node.originalScale__*1.02)),

                            cc.EaseOut:create(cc.ScaleTo:create(0.05,node.originalScale__, node.originalScale__),1),cc.CallFunc:create(function ()

                            node.scaleAct_ = nil

                        end)}))

                    end

                    hasClick = true

                    if node.click_callback__ then

                        node.click_callback__(node)

                    end

                    node.lastTagTime_ = curTime

                end

            end

            if not hasClick then

                if notScale == true then

                    if node.scaleAct_ then

                        node:stopAction(node.scaleAct_)

                        node.scaleAct_ = nil

                    end

                    node.scaleAct_ = transition.scaleTo(node, {scale=checknumber(node.originalScale__), time=0.2,onComplete=function ( sender )

                        sender.scaleAct_ = nil

                    end})

                end

            end

        else -- cancelled

            if notScale == true then

                if node.scaleAct_ then

                    node:stopAction(node.scaleAct_)

                    node.scaleAct_ = nil

                end

                node.scaleAct_ = transition.scaleTo(node, {scale=checknumber(node.originalScale__), time=0.2,onComplete=function ( sender )

                    sender.scaleAct_ = nil

                end})

            end

            node.touchState__ = nil

        end

        return false

    end)

    node.touchListener__ = touchListener

    if not node.onExit_ then

        node.onExit_ = node.onExit

    end

    function node:onExit( ... )

        self:onExit_(...)

        self:setTouchEnabled(false)

    end

    

    node:setTouchMode(cc.TOUCH_MODE_ONE_BY_ONE)

    node:setTouchCaptureEnabled(true)

    node:setTouchSwallowEnabled(swallow)

    -- node:setCascadeTouchEnabled(false)

end

function remove_click( node )

    node:setTouchEnabled(false)

    if node.touchListener__ then

        node:removeNodeEventListener(node.touchListener__)

        node.touchListener__ = nil

        node.click_callback__ = nil

    end

end

function add_touch( node, cb , mode, capture, swallow)

    if not node then return end

    mode = mode or cc.TOUCH_MODE_ONE_BY_ONE -- 单点触摸

    if capture == nil then capture = true end

    if swallow == nil then swallow = true end

    -- 添加触摸事件处理函数

    local touchListener = node:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)

        return cb(event)

    end)

    node.touchListener__ = touchListener

    node.onExit_ = node.onExit

    function node.onExit( ... )

        node:onExit_(...)

        node:setTouchEnabled(false)

    end

    node:setTouchEnabled(true)

    node:setTouchMode(mode)

    node:setTouchCaptureEnabled(capture)

    node:setTouchSwallowEnabled(swallow)

    node:setCascadeTouchEnabled(false)  

end

--添加提示

function add_tipHanlder(panel,award,isSwallow,nowShowHero,otherTips,params)

    panel.data_ = award

    local starPos = nil

    if isSwallow == nil then

        isSwallow = false

    end

    UiUtil.closeTip()

    add_touch(panel,function (event)

        if event.name == "began" then

            -- starPos = cc.p(event.x,event.y)

            local size = panel:getContentSize()

            starPos = panel:convertToWorldSpace(cc.p(size.width*0.5,size.height*0.5))

            local data = panel.data_

            if data ~= nil and #data == 3 then

                if data[1] == GameEnum.REWARD_TYPE.HERO and not nowShowHero then

                    require_ex("app.view.hero.HeroInfoView").new(data[2]):push()

                elseif data[1] == GameEnum.REWARD_TYPE.PLAYER_EQUIP_CHIP then

                    local dataParams = params or {chipId = data[2]}

                    UiUtil.showRoleEquipChipTip(dataParams,starPos)

                else

                    UiUtil.showTip(data[1],data[2],starPos,data[3],otherTips)

                end

            end

            return true

        elseif event.name == "moved" then

            if starPos == nil then

                return

            end

            local offx = math.abs(event.x - starPos.x)

            local offy = math.abs(event.x - starPos.x)

            if offx >= 8 or offy >= 8 then

                UiUtil.closeTip()

                starPos = nil

            end

        elseif event.name == "ended" then

            -- UiUtil.closeTip()

        end

    end,nil,true,isSwallow)

end

function add_medalSkillTipHanlder(panel,skillType,id,isSwallow)

    if isSwallow == nil then

        isSwallow = false

    end

    local starPos = nil

    if isSwallow == nil then

        isSwallow = false

    end

    UiUtil.closeMedalTip()

    add_touch(panel,function (event)

        if event.name == "began" then

            -- starPos = cc.p(event.x,event.y)

            local size = panel:getContentSize()

            starPos = panel:convertToWorldSpace(cc.p(size.width*0.5,size.height*0.5))

            UiUtil.showMedalTip(skillType,id,starPos)

            return true

        elseif event.name == "moved" then

            if starPos == nil then

                return

            end

            local offx = math.abs(event.x - starPos.x)

            local offy = math.abs(event.x - starPos.x)

            if offx >= 8 or offy >= 8 then

                UiUtil.closeMedalTip()

                starPos = nil

            end

        elseif event.name == "ended" then

            -- UiUtil.closeMedalTip()

        end

    end,nil,true,isSwallow)

end

function add_heroSkillTipHanlder(panel,heroSkillId)

    if isSwallow == nil then

        isSwallow = false

    end

    local starPos = nil

    if isSwallow == nil then

        isSwallow = false

    end

    UiUtil.closeHeroSkillTip()

    add_touch(panel,function (event)

        if event.name == "began" then

            -- starPos = cc.p(event.x,event.y)

            local size = panel:getContentSize()

            starPos = panel:convertToWorldSpace(cc.p(size.width*0.5,size.height*0.5))

            UiUtil.showHeroSkillTip(heroSkillId,starPos)

            return true

        elseif event.name == "moved" then

            if starPos == nil then

                return

            end

            local offx = math.abs(event.x - starPos.x)

            local offy = math.abs(event.x - starPos.x)

            if offx >= 8 or offy >= 8 then

                UiUtil.closeHeroSkillTip()

                starPos = nil

            end

        elseif event.name == "ended" then

            -- UiUtil.closeMedalTip()

        end

    end,nil,true,isSwallow)

end

function add_medalRewardTipHanlder(panel,medal_id,isSwallow)

    if isSwallow == nil then

        isSwallow = false

    end

    local starPos = nil

    if isSwallow == nil then

        isSwallow = false

    end

    UiUtil.closeMedalRewardTip()

    add_touch(panel,function (event)

        if event.name == "began" then

            starPos = cc.p(event.x,event.y)

            UiUtil.showMedalRewardTip(medal_id,starPos)

            return true

        elseif event.name == "moved" then

            if starPos == nil then

                return

            end

            local offx = math.abs(event.x - starPos.x)

            local offy = math.abs(event.x - starPos.x)

            if offx >= 8 or offy >= 8 then

                UiUtil.closeMedalRewardTip()

                starPos = nil

            end

        elseif event.name == "ended" then

            -- UiUtil.closeMedalRewardTip()

        end

    end,nil,true,isSwallow)

end

function add_heroTipHanlder(panel,heroId,isSwallow)

    if isSwallow == nil then

        isSwallow = false

    end

    local starPos = nil

    if isSwallow == nil then

        isSwallow = false

    end

    UiUtil.closeHeroTip()

    add_touch(panel,function (event)

        if event.name == "began" then

            starPos = cc.p(event.x,event.y)

            UiUtil.showHeroTip(heroId,starPos)

            return true

        elseif event.name == "moved" then

            if starPos == nil then

                return

            end

            local offx = math.abs(event.x - starPos.x)

            local offy = math.abs(event.x - starPos.x)

            if offx >= 8 or offy >= 8 then

                UiUtil.closeHeroTip()

                starPos = nil

            end

        elseif event.name == "ended" then

        end

    end,nil,true,isSwallow)

end

function add_planeCardHanlder(panel,planeIds)

    local starPos = nil

    if isSwallow == nil then

        isSwallow = false

    end

    UiUtil.closePlaneCardTip()

    add_touch(panel,function (event)

        if event.name == "began" then

            panel:setScale(0.98)

            starPos = cc.p(event.x,event.y)

            UiUtil.showPlaneCardTip(planeIds,starPos)

            return true

        elseif event.name == "moved" then

            if starPos == nil then

                return

            end

            local offx = math.abs(event.x - starPos.x)

            local offy = math.abs(event.x - starPos.x)

            if offx >= 8 or offy >= 8 then

                UiUtil.closePlaneCardTip()

                starPos = nil

            end

        elseif event.name == "ended" then

            panel:setScale(1)

        else

            panel:setScale(1)

        end

    end,nil,true,isSwallow)

end

function add_partySupplyTipHanlder(panel,keyId,isSwallow)

    if isSwallow == nil then

        isSwallow = false

    end

    UiUtil.closePartySupplyTip()

    add_touch(panel,function (event)

        if event.name == "began" then

            starPos = cc.p(event.x,event.y)

            UiUtil.showPartySupplyTip(keyId,starPos)

            return true

        elseif event.name == "moved" then

            if starPos == nil then

                return

            end

            local offx = math.abs(event.x - starPos.x)

            local offy = math.abs(event.x - starPos.x)

            if offx >= 8 or offy >= 8 then

                UiUtil.closePartySupplyTip()

                starPos = nil

            end

        elseif event.name == "ended" then

        end

    end,nil,true,isSwallow)

end

function add_antiqueTipHanlder(panel,keyId,isSwallow)

    if isSwallow == nil then

        isSwallow = false

    end

    -- UiUtil.closeAntiqueTip()

    add_touch(panel,function (event)

        if event.name == "began" then

            starPos = cc.p(event.x,event.y)

            UiUtil.showAntiqueTip(keyId,starPos)

            return true

        elseif event.name == "moved" then

            if starPos == nil then

                return

            end

            local offx = math.abs(event.x - starPos.x)

            local offy = math.abs(event.x - starPos.x)

            if offx >= 8 or offy >= 8 then

                UiUtil.closeAntiqueTip()

                starPos = nil

            end

        elseif event.name == "ended" then

        end

    end,nil,true,isSwallow)

end

function add_worldTaskGoalTipHanlder(panel,keyId,isSwallow)

    if isSwallow == nil then

        isSwallow = false

    end

    UiUtil.closePartySupplyTip()

    add_touch(panel,function (event)

        if event.name == "began" then

            starPos = cc.p(event.x,event.y)

            UiUtil.showWorldTaskGoalTip(keyId,starPos)

            return true

        elseif event.name == "moved" then

            if starPos == nil then

                return

            end

            local offx = math.abs(event.x - starPos.x)

            local offy = math.abs(event.x - starPos.x)

            if offx >= 8 or offy >= 8 then

                UiUtil.closePartySupplyTip()

                starPos = nil

            end

        elseif event.name == "ended" then

        end

    end,nil,true,isSwallow)

end

function add_MedalMakePropTipHanlder(panel,propId,callback,isSwallow)

    if isSwallow == nil then

        isSwallow = false

    end

    UiUtil.closeMedalMakePropTip()

    add_touch(panel,function (event)

        if event.name == "began" then

            starPos = cc.p(event.x,event.y)

            UiUtil.showMedalMakePropTip(propId,callback,starPos)

            return true

        elseif event.name == "moved" then

            if starPos == nil then

                return

            end

            local offx = math.abs(event.x - starPos.x)

            local offy = math.abs(event.x - starPos.x)

            if offx >= 8 or offy >= 8 then

                UiUtil.closeMedalMakePropTip()

                starPos = nil

            end

        elseif event.name == "ended" then

        end

    end,nil,true,isSwallow)

end

function add_RoleEquipChipTipHanlder(panel,params,isSwallow)

    if isSwallow == nil then

        isSwallow = false

    end

    UiUtil.closeMedalMakePropTip()

    add_touch(panel,function (event)

        if event.name == "began" then

            -- starPos = cc.p(event.x,event.y)

            local size = panel:getContentSize()

            starPos = panel:convertToWorldSpace(cc.p(size.width*0.5,size.height*0.5))

            UiUtil.showRoleEquipChipTip(params,starPos)

            return true

        elseif event.name == "moved" then

            if starPos == nil then

                return

            end

            local offx = math.abs(event.x - starPos.x)

            local offy = math.abs(event.x - starPos.x)

            if offx >= 8 or offy >= 8 then

                UiUtil.closeMedalMakePropTip()

                starPos = nil

            end

        elseif event.name == "ended" then

        end

    end,nil,true,isSwallow)

end

-- 将字符串转换为一个一个的char

function stringToChar_(string)

    local list = {}

    local index = 1

    local len = string.len(string)

    -- for i = 1, len do

    --  print("value:", string.byte(string, i))

    -- end

    while index <= len do

        local shift = 1

        local ch = string.byte(string, index)

        if ch < 0 then ch = ch + 256 end

        if ch > 0 and ch <= 127 then shift = 1

        elseif ch >= 198 and ch <= 223 then shift = 2

        elseif ch == 224 then -- 泰文

            shift = 3

        elseif ch > 224 and ch <= 239 then shift = 3

        elseif ch >= 240 and ch <= 247 then shift = 4

        end

        local char = string.sub(string, index, index + shift - 1)

        if LABEL_DEBUG then

            gprint("charrrr:", char)

        end

        index = index + shift

        table.insert(list, char)

    end

    return list, len

end

local function charToString_(chars)

    local string = ""

    for index = 1, #chars do

        string = string .. chars[index]

    end

    return string

end

function init_button(name ,parent ,cb,tag,isScale)

    local button = findNodeByName(parent,name)

    if button then

        button:setTouchEnabled(true)

        button:setScaleAct(isScale or true)

        button:onButtonClicked(cb)

        button:setTag(tag or button:getTag())

        button:setButtonLabelColor(GameEnum.Colors[31])

        button:setButtonLabelShadow()

        return button

    else    

        gprint("---button is nil:" .. name)

        return nil

    end

end

-- 递归设置node以及所有子节点是否touch enable

function nodeCascadeTouchEnable(node, enable)

    if not node then return end

    node:setTouchEnabled(enable)

    local children = node:getChildren()

    if children then

        for index = 1, #children do

            local child = children[index]

            child:setTouchEnabled(true)

            nodeCascadeTouchEnable(child, enable)

        end

    end

end

function nodeCascadeOpacityEnable(node, enable)

    if not node then return end

    node:setCascadeOpacityEnabled(enable)

    local children = node:getChildren()

    if children then

        for index = 1, #children do

            local child = children[index]

            child:setCascadeOpacityEnabled(true)

            nodeCascadeOpacityEnable(child, enable)

        end

    end

end

function nodeCascadeCullingEnable(node, enable)

    if not node then return end

    node:setCullingEnable(enable)

    local children = node:getChildren()

    if children then

        for index = 1, #children do

            local child = children[index]

            child:setCullingEnable(enable)

            nodeCascadeCullingEnable(child, enable)

        end

    end

end

function nodeCascadeUIInputEnable( node, enable )

    if not node then return end

    if node.__cname == "UIInput" then

        node:setTouchEnabled(enable)

    end

    local children = node:getChildren()

    if children then

        for k,v in pairs(children) do

            nodeCascadeUIInputEnable(v, enable)

        end

    end

end

-- 这里sp.EventType.ANIMATION_EVENT是个枚举，共有4个本别是sp.EventType.ANIMATION_START = 0,

--  sp.EventType =

-- {

--     ANIMATION_START = 0,

--     ANIMATION_INTERRUPT = 1,

--     ANIMATION_END = 2,

--     ANIMATION_COMPLETE = 3,

--     ANIMATION_DISPOSE = 4,

--     ANIMATION_EVENT = 5,

-- }

local spineMap_ = {}

function createSpineAct( atlasPath, jsonPath , scale, useCache)

    if useCache == nil then

        useCache = false

    end

    if not scale then

        scale = 1

    end

    if not jsonPath then

        jsonPath = atlasPath .. ".json"

        atlasPath = atlasPath .. ".atlas"

    end

    --[[

    --@Author:GF

    --@CreateTime:2020-05-14 10:03:44

--@LastEditer:洪华

--@LastEditTime:2020-08-17 14:16:06

    --------功能描述-----------

    -- IOS马甲包文件换名处理

    ]]--

    if type(IOSCopy_ReName) == "function" then

        jsonPath = IOSCopy_ReName(jsonPath)

        atlasPath = IOSCopy_ReName(atlasPath)

    end

    -- local skeletonNode = sp.SkeletonAnimation:create(jsonPath, atlasPath ,scale)

    local skeletonNode = sp.SkeletonAnimation:createFromCache(jsonPath, atlasPath ,scale)

    function skeletonNode:play( animation, loop , trackIndex)

        assert(type(animation) == "string")

        if loop == nil then

            loop = false

        end

        trackIndex = trackIndex or 0

        self:setAnimation(trackIndex, animation, loop)

    end

    if not spineMap_[jsonPath] then

        spineMap_[jsonPath] = useCache

    end

    return skeletonNode

end

function clearSpineAct()

    -- gdump(spineMap_, "@^^^^^^^clearSpineAct^^^^^")

    for k,v in pairs(spineMap_) do

        if v == false then

            spineMap_[k] = nil

            sp.SkeletonAnimation:removeCache(k)

        end

    end

end

function clearAllSpineAct()

   spineMap_ = {}

   sp.SkeletonAnimation:clearCache()  

end

function removeSpineAct( jsonPath )

    jsonPath = jsonPath .. ".json"

    spineMap_[jsonPath] = nil

    sp.SkeletonAnimation:removeCache(jsonPath)

end

    -- local particleSys = cc.ParticleSystemQuad:create(path)

    -- particleSys:setPosition(display.width/2, 200)

    -- particleSys:addTo(self.bg_, 1)

function createParticle( path )

    local particleSys = cc.ParticleSystemQuad:create(path)

    return particleSys

end

local manager = ccs.ArmatureDataManager:getInstance()

local sharedTextureCache = cc.Director:getInstance():getTextureCache()

local sharedSpriteFrameCache = cc.SpriteFrameCache:getInstance()

function armature_add(imagePath, plistPath, configFilePath)

    if not plistPath or not configFilePath then

        plistPath = imagePath .. ".plist"

        configFilePath = imagePath .. ".xml"

        imagePath = imagePath .. ".pvr.ccz"

    end

    manager:addArmatureFileInfo(imagePath, plistPath, configFilePath)

end

function armature_remove(imagePath, plistPath, configFilePath)

    if not plistPath or not configFilePath then

        plistPath = imagePath .. ".plist"

        configFilePath = imagePath .. ".xml"

        imagePath = imagePath .. ".pvr.ccz"

    end

    manager:removeArmatureFileInfo(configFilePath)

    sharedSpriteFrameCache:removeSpriteFramesFromFile(plistPath)

    sharedTextureCache:removeTextureForKey(imagePath)

end

function armature_create(armatureName, x, y, movementHandler)

    x = x or 0

    y = y or 0

    local armature = ccs.Armature:create(armatureName)

    armature:setPosition(x, y)

    -- connectMovementEventSignal

    armature:getAnimation():setMovementEventCallFunc(function ( armatureBack,movementType,movementID)

        if movementHandler then movementHandler(movementType, movementID, armatureBack) end

    end)

    function armature:play(animation, durationTo, loop)

        durationTo = durationTo or -1

        loop = loop or -1

        if type(animation) == "number" then

            self:getAnimation():playWithIndex(animation, durationTo, loop)

        else

            self:getAnimation():play(animation, durationTo, loop)

        end

    end

    return armature

end

function armature_callback(armature, movementHandler)

    if not armature then return end

    if armature.movementHandler_ then

        armature.movementHandler_ = movementHandler

        return

    end

    armature.movementHandler_ = movementHandler

    armature:getAnimation():setMovementEventCallFunc(function ( armatureBack,movementType,movementID)

        if armature.movementHandler_ then armature.movementHandler_(movementType, movementID, armatureBack) end

    end)

end

function errorshow()

    if not ErrorFunc then

        ErrorFunc = __G__TRACKBACK__

    end

    __G__TRACKBACK__ = function ( errorMessage )

        print("----------------------------------------")

        print("LUA ERROR: " .. tostring(errorMessage) .. "\n")

        print(debug.traceback("", 2))

        print("----------------------------------------")

        if __bugly_call then

            __bugly_call(errorMessage)

        end

        if ErrShow then

            local scene = display.getRunningScene()

            if not scene.log__ then

                local node = display.newNode():addTo(scene, 100000)

                scene.log__ = node

                errY = nil

           end

           local node = scene.log__

            if not errY then

                errY = display.height-50

            end

            local t = UiUtil.label("LUA ERROR: " .. tostring(errorMessage) .. "\n",20,display.COLOR_RED,cc.size(500,0),display.TEXT_ALIGN_LEFT)

                :addTo(node):align(display.LEFT_TOP,10, errY)

            errY = errY - t:height()

            local t2 = UiUtil.label(debug.traceback(),20,display.COLOR_RED,cc.size(500,0),display.TEXT_ALIGN_LEFT):addTo(node):align(display.LEFT_TOP,10, errY)

            errY = errY - t2:height()

        end    

        return errorMessage

    end

    ErrShow = true

    -- writefile(GAME_ERROR_FILE, json.encode({ErrShow}))

end

function __bugly_call( msg )

    if device.platform == "android" then

        -- report lua exception

        buglyReportLuaException(tostring(msg), debug.traceback())

    end

end

function errorclose()

    if ErrorFunc then

        __G__TRACKBACK__ = ErrorFunc

    end

    ErrShow = false

    local scene = display.getRunningScene()

    if scene and scene.log__ then

        scene.log__:removeSelf()

        scene.log__ = nil

    end

    -- writefile(GAME_ERROR_FILE, json.encode({ErrShow}))

end

function tableCheck( tb1, tb2 )

    if type(tb1) == type(tb2) then

        if type(tb1) ~= "table" and tb1 ~= tb2 then

            return false

        elseif type(tb1) == "table" then

            if table.nums(tb1) == table.nums(tb2) then

                for k,v in pairs(tb1) do

                    if type(v) == type(tb2[k]) then

                        if type(v) ~= "table" and v ~= tb2[k] then

                            return false

                        elseif type(v) == "table" then

                            if not tableCheck(v, tb2[k]) then

                                return false

                            end

                        end

                    else

                        return false

                    end

                end

                return true

            end

        else

            return true

        end

    end

    return false

end

function pToLine( p1, p2, p)

    local cross = (p2.x - p1.x) * (p.x - p1.x) + (p2.y - p1.y) * (p.y - p1.y)

    if cross <= 0 then

        return cc.pGetDistance(p, p1), p1

    end

    local d2 = (p2.x - p1.x) * (p2.x - p1.x) + (p2.y - p1.y) * (p2.y - p1.y)

    if cross >= d2 then

        return cc.pGetDistance(p, p2), p2

    end

     

    local r = cross / d2

    local dp = cc.p(p1.x + (p2.x - p1.x) * r, p1.y + (p2.y - p1.y) * r)

    return cc.pGetDistance(p, dp), dp

end

----是否在多边形里面

-- // 返回值: 0:在外面, 1:在里面, 2:在线上

function inPolygon( poses, p )

    local n = #poses

    assert(n > 2)

    -- // 在多边形内的数量

    local nRet = 0

    local flag = 0

    local px, py = p.x,p.y

    local dis = nil

    local linePos = nil

    for i=1,n do

        local p1 = poses[i]

        local p2 = poses[i%n+1]

        -- // 求解 y=p.y 与 p1 p2 的交点  

        -- // p1p2 与 y=p0.y平行  

        -- print("@^^^^^^^^^", i, n, i % n + 1)

        if p1.y == p2.y then  

        else

            -- // 交点在p1p2延长线上  

            if p.y < math.min(p1.y, p2.y) then

            else

                -- // 交点在p1p2延长线上  

                if p.y >= math.max(p1.y, p2.y) then

                else

                -- // 求交点的 X 坐标  

                    local x = (p.y - p1.y) * (p2.x - p1.x) / (p2.y - p1.y) + p1.x

                    if x >= p.x then

                        nRet = nRet + 1

                    else

                    end

                end

            end

        end

        local distance, dp = pToLine(p1,p2,p)

        if not dis or dis > distance then

            dis = distance

            linePos = dp

        end

    end

    if 1 == nRet % 2 then

        return 1, p

    else

        return 0, linePos

    end

end

function formatstring( val )

    local h = math.floor(val/100000000)

    local l = val
    if h > 0 then

        return tostring(h) .. string.format("", l)

    else

        return tostring(l)

    end

end

function setSafeAnchor(node, anchorX, anchorY)

  local diffX = anchorX * node:getContentSize().width  * (node:getScaleX() - 1)

  local diffY = anchorY * node:getContentSize().height * (node:getScaleY() - 1)

  node:setAnchorPoint(anchorX, anchorY)

  node:setPositionX(node:getPositionX() + diffX)

  node:setPositionY(node:getPositionY() + diffY)

end

function setLabelShadow( node, shadowColor, offset )

    shadowColor = shadowColor or cc.c4b(0,0,0,255)

    offset = offset or cc.size(1,-1)

    node:enableShadow(shadowColor, offset)

end

function getPlantformId()

    -- 平台 0 安卓, 1 ios

    local platform

    if device.platform == "android" then

        platform = 0

    elseif device.platform == "ios" or device.platform == "mac" then

        platform = 1

    else

        platform = 0

    end

    return platform

end

function getNumLen(num)

    local len = 1

    local number = tonumber(num)

    while number >= 1 do

        number = number / 10

        if number >= 1 then

            len = len + 1

        end

    end

    return len

end

function setButtonLableStringForLB(btn,str,scale,color)

    if btn == nil then

        return

    end

    scale = scale or 1

    local lb = findChildByName(btn,"lb")

    if lb ~= nil then

        lb:setString(str)

        lb:setColor(color or GameEnum.Colors[31])

        setLabelShadow(lb)

        lb:setScale(scale)

        lb:center()

    end

end

-- 解析 19:34:56 这种时间格式

function decodeTime(str)

    local hour,min,sec

    local pos1 = string.find(str,":")

    local pos2 = string.find(str,":",pos1+1)

    

    local hour = string.sub(str,1,(pos1-1))

    local min = string.sub(str,(pos1+1),(pos2-1))

    local sec = string.sub(str,(pos2+1))

    hour = tonumber(hour)

    min = tonumber(min)

    sec = tonumber(sec)

    return hour,min,sec

end

-- 解析 2018-10-27 这种时间格式

function decodeDate(str)

    local year,month,day

    local pos1 = string.find(str,"-")

    local pos2 = string.find(str,"-",pos1+1)

    

    local year = string.sub(str,1,(pos1-1))

    local month = string.sub(str,(pos1+1),(pos2-1))

    local day = string.sub(str,(pos2+1))

    year = tonumber(year)

    month = tonumber(month)

    day = tonumber(day)

    return year,month,day

end

-- 解析 2018-10-27 00:00:00 这种时间格式

function decodeDateAndTime(str)

    local date , time

    local pos = string.find(str," ")

    date = string.sub(str,1,(pos-1))

    time = string.sub(str,(pos+1))

    local year,month,day = decodeDate(date)

    local hour,min,sec = decodeTime(time)

    return year,month,day,hour,min,sec

end

-- 比较一天中时间大小

-- time1 >= time2   return  true

function compareTime(time1,time2)

    if time1.hour > time2.hour then

        return true

    elseif time1.hour == time2.hour then

        if time1.min > time2.min then

            return true

        elseif time1.min == time2.min then

            if time1.sec >= time2.sec then

                return true

            end

        end

    end

    return false

end

function showLoadingBarAct( bar, val, isInit, actTime)

    if isInit then

        if bar._loaingAct_ then

            bar:stopAction(bar._loaingAct_)

            bar._loaingAct_ = nil

        end

        bar:setPercent(val)

    else

        actTime = actTime or 2

        local cur = bar:getPercent()

        local tick = 0.5

        bar.dval = (val-cur)/(actTime/tick)

        bar.val = val

        if not bar._loaingAct_ then

            bar._loaingAct_ = bar:schedule(function (sender)

                local cur = bar:getPercent()

                local dval = sender.dval

                local val = sender.val

                cur = cur + dval

                if math.abs(cur-val) < 0.5 then

                    cur = val

                    bar:stopAction(bar._loaingAct_)

                    bar._loaingAct_ = nil

                end

                bar:setPercent(cur)

            end, 0.05)

        end

    end

end

-- 多个cell在node里自适应居中对齐

--@ nowNum:当前计算的cell位置；  cellNum:cell的个数;       maxLineNum:一行最多cell个数;  offset:cell之间间隔

--@ cellSize：cell的大小;       nodeSize：node的大小;     isLastMid：最后一行是否居中

function calCellInNodePos( nowNum,cellNum,maxLineNum,offset,cellSize,nodeSize,isLastMid )

    local x = 0

    isLastMid = isLastMid or true

    local maxRowNum = math.ceil(cellNum/maxLineNum)

    local nowRow = math.ceil(nowNum/maxLineNum)

    local nowLine = (nowNum-1) % maxLineNum + 1

    local startX = (nodeSize.width - (maxLineNum * cellSize.width + (maxLineNum-1)*offset.x )) / 2

    if nowRow == maxRowNum then     -- 最后一行特殊处理

        if isLastMid then

            local lastLine = (cellNum-1) % maxLineNum + 1

            local endStartX = (nodeSize.width - (lastLine * cellSize.width + (lastLine-1)*offset.x )) / 2

            x = endStartX + (nowLine-1)*(cellSize.width + offset.x)

        else

            x = startX + (nowLine-1)*(cellSize.width + offset.x)

        end

    else

        x = startX + (nowLine-1)*(cellSize.width + offset.x)

    end

    return x

end

spriteFramesCahceMap_ = spriteFramesCahceMap_ or {}

function CachePlistFrames(plist, tag)

    tag = tag or 1

    local mapVal = cc.FileUtils:getInstance():getValueMapFromFile(plist)

    for fn,v in pairs(mapVal.frames) do

        local frame = sharedSpriteFrameCache:getSpriteFrame(fn)

        if frame then

            spriteFramesCahceMap_[fn] = {frame = frame,tag = tag}

            frame:retain()

        end

    end

end

function ClearCachePlistFrames(tag)

    for k,v in pairs(spriteFramesCahceMap_) do

        -- v.frame:release()

        if not tag or tag == v.tag then

            v.frame:release()

            spriteFramesCahceMap_[k] = nil

        end

    end

    if not tag then

        spriteFramesCahceMap_ = {}

    end

end

function convertingBit(size)

    local newSize = ""

    local kb = math.floor(size / 1024)

    if kb >= 1000 then

        newSize = string.format("%.1f", kb / 1024) .. "M"

    else

        if kb < 0 then

            kb = 0

        end

        newSize = kb .. "K"

    end

    return newSize

end

--[[

--把nodeTable所有节点看成一个整体，以posX为中点居中显示

--@param: nodeSizeTable : nodeTable每个节点的宽度 ， nodeTable每个节点需左对齐

--@param: posX ： 居中点

--@return: initPosx：第一个元素的位置点

]]--

function getNodesMiddleShowInitPosX(nodeSizeTable , posX)

    local initPosx = posX

    local allContentWidth = 0

    for i,width in ipairs(nodeSizeTable) do

        allContentWidth = allContentWidth + width

    end

    initPosx = posX - allContentWidth / 2

    return initPosx

end

--[[

--把nodes所有节点看成一个整体，以posX为中点居中显示

--@param: nodes : nodes每个节点 ， nodes每个节点需左对齐

--@param: posX ： 居中点

]]--

function setNodesMiddle( nodes , posX , margin )

    local nodeSizeTable = {}

    for i,node in ipairs(nodes) do

        local width = node:getContentSize().width * node:getScaleX()

        table.insert( nodeSizeTable , ( i < #nodes ) and (width + (margin or 0)) or width )

    end

    local initPosx = getNodesMiddleShowInitPosX(nodeSizeTable , posX)

    local nowPosX = initPosx

    for i,node in ipairs(nodes) do

        node:setPositionX(nowPosX)

        nowPosX = nowPosX + node:getContentSize().width * node:getScaleX() + (margin or 0)

    end

end

-- 检测两个table数据是否一样

function checkTableSame( tb1, tb2 )

    if type(tb1) == type(tb2) then

        if type(tb1) ~= "table" and tb1 ~= tb2 then

            return false

        elseif type(tb1) == "table" then

            if table.nums(tb1) == table.nums(tb2) then

                for k,v in pairs(tb1) do

                    if type(v) == type(tb2[k]) then

                        if type(v) ~= "table" and v ~= tb2[k] then

                            return false

                        elseif type(v) == "table" then

                            if not checkTableSame(v, tb2[k]) then

                                return false

                            end

                        end

                    else

                        return false

                    end

                end

                return true

            end

        else

            return true

        end

    end

    return false

end

function urlEncode(s)

     s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%X", string.byte(c)) end)  

    return string.gsub(s, " ", "+")  

end  

function urlDecode(s)

    s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)  

    return s  

end  


