local player =class("player")
function player:ctor()
end
function player:initData(game)
    self.anim = self.node:getChildByName("sprite")
    self.inputEnabled = false;
    self.isAttacking = false;
    self.isAlive = true;
    self.nextPoseSF = null;
    --self.registerInput();
    self.spArrow = self.node:getChildByName("arrow")
    self.spArrow.active = false;
    self.atkTargetPos = cc.p(0,0);
    self.isAtkGoingOut = false;
    --待测试
    self.validAtkRect = cc.rect(25, 25, (self.node:getParent():getBoundingBox().width- 50), (self.node:getParent():getBoundingBox().height - 50));
    
    self.oneSlashKills = 0;
    --animationManager:playAnimationClip(menuAnim,"menuAnim")
end
function player:init(node,game)
    self.game = game

    --添加事件监听
    self.node = node
    local function onSceneEvent(event)  
        if event == "enter" then
           self:enter(game)
        elseif event == "enterTransitionFinish" then

           self:entertransitionfinish()

        elseif event == "exit" then

           self:exit()

        elseif event == "exitTransitionStart" then

           self:exittransitionstart()

        elseif event == "cleanup" then

           self:cleanup()

        end
    end
    node:registerScriptHandler(onSceneEvent)
end
function player:enter()
    self:initData();
end
function player:entertransitionfinish()
    ----开启update函数 
    local function handler(interval)
         self:update(interval)
    end
    self.node:scheduleUpdateWithPriorityLua(handler,0)
end
function player:update(dt)
    
end
function player:exit()

end
function player:exittransitionstart()

end
function player:cleanup()

end
return player

