RequestStreamedTextureDict("fiveM_headerss")
RequestStreamedTextureDict("freemodeTextD")
local debugWindowTextureDict = "shared"
local debugWindowTexture = "bggradient"
local debugWindowXPos = 0.85
local debugWindowYPos = 0.42
local debugWindowSizeX = 0.28
local debugWindowSizeY = 0.70
local debugWindowHeading = 0.0
local debugWindowColorR = 0
local debugWindowColorG = 0
local debugWindowColorB = 0
local debugWindowTranparency = 200
local showInfo = true
local debugWindowConfigMenu = true
local moveWindowSprite = false
function drawTxt(text, font, centre, x, y, scale, r, g, b, a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

---------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------put entity name or hash here---------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
function things(modelHash)
   stuff = modelHash
end
things(1098542403)
----------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------this sets delete gun toggle to off --------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
 deleteGunToggle = false
----------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------this gets info about spawned entity and player----------------------------------------
----------------------------------------------------------------------------------------------------------------------------------


Citizen.CreateThread(function()	
  while true do
    if IsControlPressed(0, 21) and IsControlJustPressed(1, 168) and not IsControlPressed(1, 62) then
     showInfo = not showInfo
    end 
	if IsControlPressed(0, 62) and IsControlJustPressed(1, 168) and not IsControlPressed(0, 21) then
     debugWindowConfigMenu = not debugWindowConfigMenu
    end
     Citizen.Wait(0) 
	 playerPed = GetPlayerPed(PlayerId())
     playerCoords = GetEntityCoords(GetPlayerPed(PlayerId()), true)
	 playerCoordsX = playerCoords.x
	 playerCoordsY = playerCoords.y
	 playerCoordsZ = playerCoords.z
	 playerHeading = GetEntityHeading(GetPlayerPed(PlayerId()))
	 PlayerRoomKey = GetRoomKeyFromEntity(GetPlayerPed(PlayerId()))
	 playerInteriorID = GetInteriorFromEntity(GetPlayerPed(PlayerId()))
	 entityRoomKey = GetRoomKeyFromEntity(a)
	 entityInteriorID = GetInteriorFromEntity(a)
     entityCoords = GetEntityCoords(closestEntity, true)
	 interiorGroupID = GetInteriorGroupId(entityInteriorID)

     ForceRoomForEntity(a, playerInteriorID, PlayerRoomKey)
	 EntityInterior = GetInteriorFromEntity(a)
	 EntityRoomKey = GetRoomKeyFromEntity(a)
	if showInfo then
	  --SetNetworkIdExistsOnAllMachines(dude10, true)
	  --NetworkRegisterEntityAsNetworked(dude10)
	  --NetworkSetEntityVisibleToNetwork(dude10, true)
	  requestControl = NetworkRequestControlOfEntity(dude10)
 
	local entityCoords = GetEntityCoords(dude10)
	local entityRot = GetEntityRotation(dude10, 2)
    local playerRot = GetEntityRotation(GetPlayerPed(), 2)
	local playerCoords = GetEntityCoords(GetPlayerPed())
	local isEntityNetworked = NetworkHasControlOfEntity(dude10)
	  if requestControl == 1 then
	   networkHasControl = 'yes'
	  elseif requestControl == false then
	   networkHasControl = 'no'
	  end
	  if isEntityNetworked == 1 then
	   isNetworked = 'yes'
	  elseif isEntityNetworked == false then
	   isNetworked = 'no'
	  end
	  if doesEntityExist == 1 then
	   networkIDExist = 'yes'
	  elseif doesEntityExist == false then
	   networkIDExist = 'no'
	  end	  
	  
	 entityNetworkID = NetworkGetNetworkIdFromEntity(dude10)
     doesEntityExist = NetworkDoesNetworkIdExist(NetworkGetNetworkIdFromEntity(dude10))
      SetEntityAsMissionEntity(dude10, 1, 0)
     DrawSprite(debugWindowTextureDict,debugWindowTexture, debugWindowXPos, debugWindowYPos, debugWindowSizeX, debugWindowSizeY, debugWindowHeading, debugWindowColorR, debugWindowColorG, debugWindowColorB, debugWindowTranparency)
	 DrawSprite("fiveM_headerss", "header-295-2", debugWindowXPos, debugWindowYPos - 0.325, 0.131, 0.043, 0.0, 255, 255, 255, 255)
     drawTxt('dave\'s ', 6, 1, debugWindowXPos - 0.030, debugWindowYPos - 0.343 , 0.5, 0, 255, 0, 255)
	 drawTxt('DEBUG INFO ', 6, 1, debugWindowXPos + 0.023, debugWindowYPos - 0.343 , 0.5, 255, 0, 0, 255)
     drawTxt('entity ID: ', 6, 1, debugWindowXPos - 0.05, debugWindowYPos - 0.310 , 0.6, 255, 255, 255, 255)
     drawTxt(tostring(dude10), 6, 1, debugWindowXPos + 0.05, debugWindowYPos - 0.310 , 0.6, 0, 255, 255, 255)
     drawTxt('entity model hash: ', 6, 1, debugWindowXPos - 0.05, debugWindowYPos - 0.280 , 0.6, 255, 255, 255, 255)
     drawTxt(tostring(GetEntityModel(dude10)), 6, 1, debugWindowXPos + 0.05, debugWindowYPos - 0.280 , 0.6, 0, 255, 255, 255)
     drawTxt('entity interior: ', 6, 1, debugWindowXPos - 0.05, debugWindowYPos - 0.250, 0.6, 255, 255, 255, 255)
     drawTxt(tostring(GetInteriorFromEntity(dude10)) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos - 0.250, 0.6, 0, 255, 255, 255)
     drawTxt('networkID: ', 6, 1, debugWindowXPos - 0.05, debugWindowYPos - 0.220, 0.6, 255, 255, 255, 255)
     drawTxt(tostring(NetworkGetNetworkIdFromEntity(dude10)) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos - 0.220, 0.6, 0, 255, 255, 255)
     drawTxt('is entity networked: ', 6, 1, debugWindowXPos - 0.05, debugWindowYPos - 0.190, 0.6, 255, 255, 255, 255)
     drawTxt(tostring(isNetworked) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos - 0.190, 0.6, 0, 255, 255, 255)
     drawTxt('does network have control', 6, 1, debugWindowXPos - 0.05, debugWindowYPos - 0.160, 0.6, 255, 255, 255, 255)
     drawTxt(tostring(networkHasControl) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos - 0.160, 0.6, 0, 255, 255, 255)
     drawTxt('does networkID exist', 6, 1, debugWindowXPos - 0.05, debugWindowYPos - 0.130, 0.6, 255, 255, 255, 255)
     drawTxt(tostring(networkIDExist) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos - 0.130, 0.6, 0, 255, 255, 255)
     drawTxt('entity X coords: ', 6, 1, debugWindowXPos - 0.05, debugWindowYPos - 0.100, 0.6 , 0, 255, 0, 255)
     drawTxt(tostring(entityCoords.x) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos - 0.100, 0.6, 0, 255, 0, 255)
     drawTxt("entity Y coords: ", 6, 1, debugWindowXPos - 0.05, debugWindowYPos - 0.070, 0.6, 0, 255, 0, 255)
     drawTxt(tostring(entityCoords.y) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos - 0.070, 0.6, 0, 255, 0, 255)
     drawTxt("entity Z coords: ", 6, 1, debugWindowXPos - 0.05, debugWindowYPos - 0.040, 0.6, 0, 255, 0, 255)
     drawTxt(tostring(entityCoords.z) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos - 0.040, 0.6, 0, 255, 0, 255)
     drawTxt('entity X rotation: ', 6, 1, debugWindowXPos - 0.05, debugWindowYPos - 0.010, 0.6, 0, 255, 0, 255)
     drawTxt(tostring(entityRot.x) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos - 0.010, 0.6, 0, 255, 0, 255)
     drawTxt('entity Y rotation: ', 6, 1, debugWindowXPos - 0.05, debugWindowYPos + 0.020, 0.6, 0, 255, 0, 255)
     drawTxt(tostring(entityRot.y) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos + 0.020, 0.6, 0, 255, 0, 255)
     drawTxt('entity Z rotation: ', 6, 1, debugWindowXPos - 0.05, debugWindowYPos + 0.050, 0.6, 0, 255, 0, 255)
     drawTxt(tostring(entityRot.z) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos + 0.050, 0.6, 0, 255, 0, 255)
     drawTxt('Player X rotation: ', 6, 1, debugWindowXPos - 0.05, debugWindowYPos + 0.08, 0.6, 255, 255, 255, 255)
     drawTxt(tostring(playerRot.x) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos + 0.080, 0.6, 0, 0, 255, 255)
     drawTxt('Player Y rotation: ', 6, 1, debugWindowXPos - 0.05, debugWindowYPos + 0.110, 0.6, 255, 255, 255, 255)
     drawTxt(tostring(playerRot.y) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos + 0.110, 0.6, 0, 0, 255, 255)
     drawTxt('Player Z rotation: ', 6, 1, debugWindowXPos - 0.05, debugWindowYPos + 0.140, 0.6, 255, 255, 255, 255)
     drawTxt(tostring(playerRot.z) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos + 0.140, 0.6, 0, 0, 255, 255)
     drawTxt('Player X position: ', 6, 1, debugWindowXPos - 0.05, debugWindowYPos + 0.170, 0.6, 255, 255, 255, 255)
     drawTxt(tostring(playerCoords.x) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos + 0.170, 0.6, 0, 255, 0, 255)
     drawTxt('Player Y position: ', 6, 1, debugWindowXPos - 0.05, debugWindowYPos + 0.20, 0.6, 255, 255, 255, 255)
     drawTxt(tostring(playerCoords.y) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos + 0.20, 0.6, 0, 255, 0, 255)
     drawTxt('Player Z position: ', 6, 1, debugWindowXPos - 0.05, debugWindowYPos + 0.23, 0.6, 255, 255, 255, 255)
     drawTxt(tostring(playerCoords.z) , 6, 1, debugWindowXPos + 0.05, debugWindowYPos + 0.23, 0.6, 0, 255, 0, 255)
     drawTxt('Player Heading: ', 6, 1, debugWindowXPos - 0.05, debugWindowYPos + 0.26, 0.6, 255, 255, 255, 255)
     drawTxt(tostring(GetEntityHeading(GetPlayerPed())), 6, 1, debugWindowXPos + 0.05, debugWindowYPos + 0.26, 0.6, 0, 255, 0, 255)
	 drawTxt('please note the rotation \"order\" is always 2 ', 6, 1, debugWindowXPos, debugWindowYPos + 0.29, 0.6, 255, 0, 0, 150)
	 
	end	
	if debugWindowConfigMenu == true then
--------------------------------------------------------------------------------------------------------------
local mouseX = GetControlNormal(2, 239)
local mouseY = GetControlNormal(2, 240)
--------------------------------------------------------------------------------------------------------------
--------------------------------------config button "move window"---------------------------------------------
--------------------------------------------------------------------------------------------------------------
local moveWindowButtotLeftEdge = (debugWindowXPos + debugWindowSizeX / 3) - (debugWindowSizeX - debugWindowSizeX + 0.08) / 2
local moveWindowButtotRightEdge = (debugWindowXPos + debugWindowSizeX / 3) + (debugWindowSizeX - debugWindowSizeX + 0.08) / 2
local moveWindowButtotTopEdge = (debugWindowYPos + debugWindowSizeY / 2 + 0.05) - (debugWindowSizeY - 0.58) / 2
local moveWindowButtotBottonEdge = (debugWindowYPos + debugWindowSizeY / 2 + 0.05) + (debugWindowSizeY - 0.58) / 2
--------------------------------------------------------------------------------------------------------------
--------------------------------------config button "change color"---------------------------------------------
--------------------------------------------------------------------------------------------------------------
local buttonX3 = (debugWindowXPos) - (debugWindowSizeX - debugWindowSizeX + 0.08) / 2
local buttonX4 = (debugWindowXPos) + (debugWindowSizeX - debugWindowSizeX + 0.08) / 2
local buttonY3 = (debugWindowYPos + debugWindowSizeY / 2 + 0.05) - (debugWindowSizeY - 0.58) / 2
local buttonY4 = (debugWindowYPos + debugWindowSizeY / 2 + 0.05) + (debugWindowSizeY - 0.58) / 2
SetCurrentPedWeapon(PlayerPedId(-1), GetHashKey("weapon_unarmed"))
	 DrawSprite("fiveM_headerss", "header-295-2", debugWindowXPos , (debugWindowYPos + debugWindowSizeY / 2 + 0.05), debugWindowSizeX, debugWindowSizeY - 0.55, 0.0, 255, 255, 255, 255)
	  DrawSprite(debugWindowTextureDict, debugWindowTexture, (debugWindowXPos - debugWindowSizeX / 3) , (debugWindowYPos + debugWindowSizeY / 2 + 0.05), (debugWindowSizeX - debugWindowSizeX + 0.08), debugWindowSizeY - 0.58, 0.0, 255, 255, 255, 255)
	  DrawSprite(debugWindowTextureDict, debugWindowTexture, (debugWindowXPos) , (debugWindowYPos + debugWindowSizeY / 2 + 0.05), (debugWindowSizeX - debugWindowSizeX + 0.08), debugWindowSizeY - 0.58, 0.0, 255, 255, 255, 255)
	  DrawSprite(debugWindowTextureDict, debugWindowTexture, (debugWindowXPos + debugWindowSizeX / 3) , (debugWindowYPos + debugWindowSizeY / 2 + 0.05), (debugWindowSizeX - debugWindowSizeX + 0.08), (debugWindowSizeY - 0.58), 0.0, 0, 0, 0, 200)
	  drawTxt('move \n window', 6, 1, (debugWindowXPos + debugWindowSizeX / 3) , (debugWindowYPos + debugWindowSizeY / 2 ), 0.6, 255, 255, 255, 255)
	  ShowCursorThisFrame()
	  
	  if (mouseX > moveWindowButtotLeftEdge and mouseX < moveWindowButtotRightEdge) and (mouseY >= moveWindowButtotTopEdge and mouseY <= moveWindowButtotBottonEdge) then
	   DrawSprite(debugWindowTextureDict, debugWindowTexture, (debugWindowXPos + debugWindowSizeX / 3) , (debugWindowYPos + debugWindowSizeY / 2 + 0.05), (debugWindowSizeX - debugWindowSizeX + 0.08), debugWindowSizeY - 0.58, 0.0, 0, 0, 255, 255)
	    moveWindow = true
	    if IsControlJustPressed(2, 237) and moveWindow == true then
         moveWindowSprite = true
		end   
	   else
        moveWindow = false	   
	   end
	   
	  if (mouseX > buttonX3 and mouseX < buttonX4) and (mouseY >= buttonY3 and mouseY <= buttonY4) then
	   DrawSprite(debugWindowTextureDict, debugWindowTexture, (debugWindowXPos) , (debugWindowYPos + debugWindowSizeY / 2 + 0.05), (debugWindowSizeX - debugWindowSizeX + 0.08), debugWindowSizeY - 0.58, 0.0, 0, 0, 255, 255)
	    windowColor = true
	    if IsControlJustPressed(2, 237) and moveWindow == true then
         changeColor = true
		end   
	   else
        windowColor = false	   
	   end
  
        if moveWindowSprite == true then
		 DrawSprite(debugWindowTextureDict, debugWindowTexture, (debugWindowXPos) , (debugWindowYPos), 0.05, 0.05, 0.0, 255, 255, 255, 150)
		  if (mouseX > (debugWindowXPos - 0.05) and mouseX < (debugWindowXPos + 0.05)) and (mouseY >= (debugWindowYPos - 0.05) and mouseY <= (debugWindowYPos + 0.05)) then
		    DrawSprite(debugWindowTextureDict, debugWindowTexture, (debugWindowXPos) , (debugWindowYPos), 0.05, 0.05, 0.0, 0, 0, 255, 150)
		   if IsControlPressed(2, 237) then
		    DrawSprite(debugWindowTextureDict, debugWindowTexture, (debugWindowXPos) , (debugWindowYPos), 0.05, 0.05, 0.0, 0, 255, 0, 255)
		    debugWindowXPos = mouseX
			debugWindowYPos = mouseY
		   end

		   if IsControlJustReleased(2, 237) then
		    moveWindowSprite = false
		   end
		  end
		end


	 end
-----------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------this checks if the spawned entity exists and moves it as player pushes buttons---------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
	if not DoesEntityExist(a) or DoesEntityExist(GetClosestObjectOfType(playerCoordsX, playerCoordsY, playerCoordsZ, 50.0, stuff, 0, 1, 0))  then
	 a = GetClosestObjectOfType(playerCoordsX, playerCoordsY, playerCoordsZ, 50.0, stuff, 0, 1, 0)
    end
    if DoesEntityExist(a) then
     b = ObjToNet(a)	 
--this gets the entity coords
		entityCoords = GetEntityCoords(a)
		entityCoords1 = GetEntityCoords(b)		
--this splits up the coords 
		  entityX = entityCoords.x
		  entityY = entityCoords.y
		  entityZ = entityCoords.z
		  entityX1 = entityCoords1.x
		  entityY1 = entityCoords1.y
		  entityZ1 = entityCoords1.z		  
--this gets the entity rotation
		entityRot = GetEntityRotation(a)
		entityRot1 = GetEntityRotation(b)		
--this splits up the rotation 
		  entityRotX = entityRot.x
	      entityRotY = entityRot.y
		  entityRotZ = entityRot.z
		  entityRotX1 = entityRot1.x
	      entityRotY1 = entityRot1.y
		  entityRotZ1 = entityRot1.z		  
	end
--if left shift is pressed then movement speed is slower
	if IsControlPressed(0, 21) then
      	moveSpeed = 0.01
		moveSpeed1 = 0.2
    else 
        moveSpeed = 0.1
		moveSpeed1 = 1.3
	 end

--this sets "a" to nil if no entity was spawned and no entity of type found near player
      if not DoesEntityExist(a) then
       a = nil
      end
--home key
-- if control "home" key is pressed then it spawns the entity of your choosing	 
	 if IsControlJustPressed(0, 213) then
	    Citizen.Wait(500)
		 spawnStuff(stuff)
	 end
--left key
-- if control "left" key is pressed then it adds 0.01 to the x coord
	 if DoesEntityExist(a) and IsControlPressed(0, 174) then
	  if frozen == false then 
	    entityX = entityCoords.x + moveSpeed
		--sets the entity's position with result
        SetEntityCoords(a, entityX, entityY, entityZ)
	    entityX1 = entityCoords1.x + moveSpeed
		--sets the entity's position with result
        SetEntityCoords(b, entityX1, entityY1, entityZ1)			
	  end
	 end	 
--right key
-- if control "right" key is pressed then it subtract's 0.01 from the x coord
	 if DoesEntityExist(a) and IsControlPressed(0, 175) then
	  if frozen == false then	 
	    --entityCoords = GetEntityCoords(a)
	    entityX = entityCoords.x - moveSpeed
		--sets the entity's position with result
        SetEntityCoords(a, entityX, entityY, entityZ)
	    --entityCoords = GetEntityCoords(a)
	    entityX1 = entityCoords1.x - moveSpeed
		--sets the entity's position with result
        SetEntityCoords(b, entityX1, entityY1, entityZ1)			
	  end
	 end
--pageup
-- if control "pageUp" key is pressed then it adds 0.01 to the z coord
	 if DoesEntityExist(a) and IsControlPressed(0, 10) then
	  if frozen == false then
		entityZ = entityCoords.z + moveSpeed
--sets the entity's position with result
        SetEntityCoords(a, entityX, entityY, entityZ)
		entityZ1 = entityCoords1.z + moveSpeed
--sets the entity's position with result
        SetEntityCoords(b, entityX1, entityY1, entityZ1)			
	  end
	 end
--pagedown
-- if control "pageDown" key is pressed then it subtract's 0.01 from the z coord
	 if DoesEntityExist(a) and IsControlPressed(0, 11) then
	  if frozen == false then	 
		entityZ = entityCoords.z - moveSpeed
--sets the entity's position with result
        SetEntityCoords(a, entityX, entityY, entityZ)
		entityZ1 = entityCoords1.z - moveSpeed
--sets the entity's position with result
        SetEntityCoords(b, entityX1, entityY1, entityZ1)		
	 end
	end
--up key
-- if control "up" key is pressed then it subtract's 0.01 from the y coord
	 if DoesEntityExist(a) and IsControlPressed(0, 27) then
	  if frozen == false then	 
		entityY = entityCoords.y - moveSpeed	 
--sets the entity's position with result
       	SetEntityCoords(a, entityX, entityY, entityZ)
		entityY1 = entityCoords1.y - moveSpeed	 
--sets the entity's position with result
       	SetEntityCoords(b, entityX1, entityY1, entityZ1)		
	  end
	 end
--down key
-- if control "down" key is pressed then it adds 0.01 to the y coord
	 if DoesEntityExist(a) and IsControlPressed(0, 173) then
	  if frozen == false then	 
		entityY = entityCoords.y + moveSpeed
        SetEntityCoords(a, entityX, entityY, entityZ)
		entityY1 = entityCoords1.y + moveSpeed
        SetEntityCoords(b, entityX1, entityY1, entityZ1)			
	  end
	 end

	 --leftshift AND "E"
-- if left shift AND "E" key are pressed then it deletes the entity
--and any other entity close to the player with the same hashkey
	 if IsControlPressed(0, 21) and IsControlPressed(0, 38) then
	    if DoesEntityExist(a) or DoesEntityExist(closestEntity) then 
	     deleteStuff()
	    end 
	 end
--numberpad "+" key
-- if numberpad "+" key is pressed then it adds 0.1 to the entity's heading(spins the thing)
	 if DoesEntityExist(a) and IsControlPressed(0, 96) then
	  if frozen == false then	 
	    entityRotZ = entityRotZ + moveSpeed1	  
--sets the entity's heading with result
		SetEntityRotation(a, entityRotX, entityRotY, entityRotZ)
	    entityRotZ1 = entityRotZ1 + moveSpeed1	  
--sets the entity's heading with result
		SetEntityRotation(b, entityRotX1, entityRotY1, entityRotZ1)		
	  end
	 end
--numberpad "-" key
-- if numberpad "-" key is pressed then it subtract's 0.1 from the entity's heading(spins the thing)
	 if DoesEntityExist(a) and IsControlPressed(0, 97) then
	  if frozen == false then
        entityRotZ = entityRotZ - moveSpeed1			
		--sets the entity's heading with result
		SetEntityRotation(a, entityRotX, entityRotY, entityRotZ)
        entityRotZ1 = entityRotZ1 - moveSpeed1			
		--sets the entity's heading with result
		SetEntityRotation(b, entityRotX1, entityRotY1, entityRotZ1)		
	  end
	 end
	 --the "[" key
     if DoesEntityExist(a) and IsControlPressed(0, 39) then
	  if frozen == false then
        --entityRot = GetEntityRotation(a)
	    entityRotY = entityRotY + moveSpeed1
		--sets the entity's rotation with result
		SetEntityRotation(a, entityRotX, entityRotY, entityRotZ)
        --entityRot = GetEntityRotation(a)
	    entityRotY1 = entityRotY1 + moveSpeed1
		--sets the entity's rotation with result
		SetEntityRotation(b, entityRotX1, entityRotY1, entityRotZ1)		
	  end
	 end
	 -- the "]" key
     if (DoesEntityExist(a) and IsControlPressed(0, 40)) then
	  if frozen == false then		
        --entityRot = GetEntityRotation(a)		
	    entityRotY = entityRotY - moveSpeed1 		
		--sets the entity's rotation with result
		SetEntityRotation(a, entityRotX, entityRotY, entityRotZ)
	        --entityRot = GetEntityRotation(a)		
	    entityRotY1 = entityRotY1 - moveSpeed1 		
		--sets the entity's rotation with result
		SetEntityRotation(b, entityRotX1, entityRotY1, entityRotZ1)	
	  end
	 end
	 -- the "-" key
     if (DoesEntityExist(a) and IsControlPressed(0, 84)) then
	  if frozen == false then
        --entityRot = GetEntityRotation(a)		
	    entityRotX = entityRotX - moveSpeed1 		
		--sets the entity's rotation with result
		SetEntityRotation(a, entityRotX, entityRotY, entityRotZ)
	        --entityRot = GetEntityRotation(a)		
	    entityRotX1 = entityRotX1 - moveSpeed1 		
		--sets the entity's rotation with result
		SetEntityRotation(b, entityRotX1, entityRotY1, entityRotZ1)	
	  end
	 end
	 -- the "=" key
     if (DoesEntityExist(a) and IsControlPressed(0, 83)) then
	  if frozen == false then		
        --entityRot = GetEntityRotation(a)		
	    entityRotX = entityRotX + moveSpeed1 		
		--sets the entity's rotation with result
		SetEntityRotation(a, entityRotX, entityRotY, entityRotZ)
	        --entityRot = GetEntityRotation(a)		
	    entityRotX1 = entityRotX1 + moveSpeed1 		
		--sets the entity's rotation with result
		SetEntityRotation(b, entityRotX1, entityRotY1, entityRotZ1)	
	  end
	 end	 
    end
end)

function deleteStuff()

 --this delete's the entity that was spawned or 
 --any close by entity with the the same hash key 
 if DoesEntityExist(closestEntity) and not DoesEntityExist(a) then
 --closestEntity = NetworkGetNetworkIdFromEntity(closestEntity)    
 SetEntityAsMissionEntity(closestEntity,true,true) 
 DeleteObject(closestEntity)
 end
 if DoesEntityExist(a) then
  --a = NetworkGetNetworkIdFromEntity(a)
  SetEntityAsMissionEntity(a,true,true)
  DeleteObject(a)
 end 
 if DoesEntityExist(spawnedVeh) then

 SetEntityAsMissionEntity(spawnedVeh,true,true)
 DeleteVehicle(spawnedVeh)
 DeleteEntity(spawnedVeh)
 end
 if DoesEntityExist(spawnPed) or DoesEntityExist(closestPed) then
 SetEntityAsMissionEntity(spawnPed,true,true)
 SetEntityAsMissionEntity(closestPed,true,true)
 DeletePed(spawnPed)
 end
end
-- this sets the entity's transparency
function invisibleStuff()
 SetEntityAsMissionEntity(a, true, true)
  SetEntityAlpha(a, 255)
end
function unfreezeStuff()
  FreezeEntityPosition(a, false)
   frozen = false  
end
function freezeStuff()
    FreezeEntityPosition(a, true)
	 frozen = true
end
function setCollisionStuff(bool)
  if bool == false then
	SetEntityCollision(a, true, true)
  end
  if bool == true then
    SetEntityCollision(a, false, false)
  end 
end

----------------------------
--this is the ACTUAL spawner
function spawnStuff(stuff)
Citizen.CreateThread(function() 
--this requests the model of what is to be spawned
   if DoesEntityExist(dude10) then
    dude10Model = GetEntityModel(dude10)
	 stuff = dude10Model
   end
	if not HasModelLoaded(stuff) then
	 Citizen.Wait(0)
	 RequestModel(stuff)
--if model is a veh then spawn a veh	 
	end
	if IsEntityAVehicle(dude10) then 
	 spawnedVeh = CreateVehicle(stuff, playerCoordsX, playerCoordsY, playerCoordsZ, playerHeading, 1, 1, 0)
	end
	if IsEntityAPed(dude10) then
      dude10CofigFlag = GetPedConfigFlag(dude10)
      dude10DrawVar_0 = GetPedDrawableVariation(dude10, 0)
	   dude10TexVar_0 = GetPedTextureVariation(dude10, 0)
	   dude10PaletteVar_0 = GetPedPaletteVariation(dude10, 0)
	  dude10DrawVar_1 = GetPedDrawableVariation(dude10, 1)
	   dude10TexVar_1 = GetPedTextureVariation(dude10, 1)
	   dude10PaletteVar_1 = GetPedPaletteVariation(dude10, 1)
	  dude10DrawVar_2 = GetPedDrawableVariation(dude10, 2)
	   dude10TexVar_2 = GetPedTextureVariation(dude10, 2)
	   dude10PaletteVar_2 = GetPedPaletteVariation(dude10, 2)
	  dude10DrawVar_3 = GetPedDrawableVariation(dude10, 3)
	   dude10TexVar_3 = GetPedTextureVariation(dude10, 3)
	   dude10PaletteVar_3 = GetPedPaletteVariation(dude10, 3)
	  dude10DrawVar_4 = GetPedDrawableVariation(dude10, 4)
	   dude10TexVar_4 = GetPedTextureVariation(dude10, 4)
	   dude10PaletteVar_4 = GetPedPaletteVariation(dude10, 4)
	  dude10DrawVar_5 = GetPedDrawableVariation(dude10, 5)
	   dude10TexVar_5 = GetPedTextureVariation(dude10, 5)
	   dude10PaletteVar_5 = GetPedPaletteVariation(dude10, 5)
	  dude10DrawVar_6 = GetPedDrawableVariation(dude10, 6)
	   dude10TexVar_6 = GetPedTextureVariation(dude10, 6)
	   dude10PaletteVar_6 = GetPedPaletteVariation(dude10, 6)
	  dude10DrawVar_7 = GetPedDrawableVariation(dude10, 7)
	   dude10TexVar_7 = GetPedTextureVariation(dude10, 7)
	   dude10PaletteVar_7 = GetPedPaletteVariation(dude10, 7)
	  dude10DrawVar_8 = GetPedDrawableVariation(dude10, 8)
	   dude10TexVar_8 = GetPedTextureVariation(dude10, 8)
	   dude10PaletteVar_8 = GetPedPaletteVariation(dude10, 8)
	  dude10DrawVar_9 = GetPedDrawableVariation(dude10, 9)
	   dude10TexVar_9 = GetPedTextureVariation(dude10, 9)
	   dude10PaletteVar_9 = GetPedPaletteVariation(dude10, 9)
	  dude10DrawVar_10 = GetPedDrawableVariation(dude10, 10)
	   dude10TexVar_10 = GetPedTextureVariation(dude10, 10)
	   dude10PaletteVar_10 = GetPedPaletteVariation(dude10, 10)
	  dude10DrawVar_11 = GetPedDrawableVariation(dude10, 11)
	   dude10TexVar_11 = GetPedTextureVariation(dude10, 11)
	   dude10PaletteVar_11 = GetPedPaletteVariation(dude10, 11)
	  dude10PedType = GetPedType(dude10)
	 spawnedPed = CreatePed(dude10PedType, stuff, playerCoordsX + 1, playerCoordsY + 1, playerCoordsZ, playerHeading, 0, 1)
	  SetPedComponentVariation(spawnedPed, 0, dude10DrawVar_0, dude10TexVar_0, dude10PaletteVar_0)
	  SetPedComponentVariation(spawnedPed, 1, dude10DrawVar_0, dude10TexVar_0, dude10PaletteVar_0)
	  SetPedComponentVariation(spawnedPed, 2, dude10DrawVar_0, dude10TexVar_0, dude10PaletteVar_0)
	  SetPedComponentVariation(spawnedPed, 3, dude10DrawVar_0, dude10TexVar_0, dude10PaletteVar_0)
	  SetPedComponentVariation(spawnedPed, 4, dude10DrawVar_0, dude10TexVar_0, dude10PaletteVar_0)
	  SetPedComponentVariation(spawnedPed, 5, dude10DrawVar_0, dude10TexVar_0, dude10PaletteVar_0)
	  SetPedComponentVariation(spawnedPed, 6, dude10DrawVar_0, dude10TexVar_0, dude10PaletteVar_0)
	  SetPedComponentVariation(spawnedPed, 7, dude10DrawVar_0, dude10TexVar_0, dude10PaletteVar_0)
	  SetPedComponentVariation(spawnedPed, 8, dude10DrawVar_0, dude10TexVar_0, dude10PaletteVar_0)
	  SetPedComponentVariation(spawnedPed, 9, dude10DrawVar_0, dude10TexVar_0, dude10PaletteVar_0)
	  SetPedComponentVariation(spawnedPed, 10, dude10DrawVar_0, dude10TexVar_0, dude10PaletteVar_0)
	  SetPedComponentVariation(spawnedPed, 11, dude10DrawVar_0, dude10TexVar_0, dude10PaletteVar_0)
	end
--spawn the object
   if IsEntityAnObject(dude10) then
	a = ObjToNet(CreateObjectNoOffset(stuff, playerCoordsX+1, playerCoordsY+1, playerCoordsZ, 1, 1, 0))
	setCollisionStuff(true)
    freezeStuff()
	SetEntityHeading(a, playerHeading)
   end	
end)
end


------------------------------------------------------------------------------------------------------------------
----------------this is the "delete gun active" text that gets displayed if the delete gun is on------------------
------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0) 
	  if deleteGunToggle~=false then 	  
  local position = "DELETE GUN ACTIVE"
  local offset = {x = 0.290, y = 0.850}
  local rgb = {r = 255, g = 0, b = 0}
  local alpha = 255
  local scale = 1.0
  local font = 0
            SetTextColour(rgb.r, rgb.g, rgb.b, alpha)
            SetTextFont(font)
		    SetTextScale(scale, scale)
			SetTextWrap(0.0, 1.0)
			SetTextCentre(false)
			SetTextDropshadow(2, 2, 0, 0, 0)
			SetTextEdge(1, 0, 0, 0, 205)
			SetTextEntry("STRING")
			AddTextComponentString(position)			
			DrawText(offset.x, offset.y)       
	  end	  
	end		
end)

------------------------------------------------------------------------------------------------------------------
-------------------------------this is the delete gun activation controller----------------------------------------
------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
      Wait(2000)	 
		if gary ~=false and deleteGunToggle ~=false then
            deleteGunToggle = false	
        end
    end
end)
----------------------------------------------------------------------------------------------------------------------
------------------------------------this is the "meat" of the delete gun----------------------------------------------
-------------------if the delete gun is active the it deletes what ever the player is looking at----------------------
----------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    pedDeleted = "a ped got DELETED: "
    vehDeleted = "a veh got DELETED: "
	objDeleted = "an obj get DELETED: "
   while true do  
     Wait(1000)
      gary = IsControlPressed(0, 178)
      if gary ~=false and deleteGunToggle ~=true then
	    deleteGunToggle = true
		 Wait(0)
      end
	  Wait(0)
	dude5 = PlayerId()
	dude6 = IsPlayerFreeAiming(dude5)
	if dude6 ~=false then
	 dude10 = Citizen.InvokeNative(0x2975C866E6713290, dude5, Citizen.PointerValueInt(), Citizen.ResultAsString(dude10))
	 Citizen.Trace('**********************')
	 Citizen.Trace('what player is aiming at')
	 Citizen.Trace('**********************')
	 Citizen.Trace('entity ID = '..tostring(dude10))
	 Citizen.Trace('entity model hash = '..tostring(GetEntityModel(dude10)))
	 Citizen.Trace('entity coords = '..tostring(GetEntityCoords(dude10)))
	 Citizen.Trace('entity rotation = '..tostring(GetEntityRotation(dude10)))
	 Citizen.Trace('entity interior = '..tostring(GetInteriorFromEntity(dude10)))
	 Citizen.Trace('entity roomKey = '..tostring(GetRoomKeyFromEntity(dude10)))
	 Citizen.Trace('object_to_net = '..tostring(entityNetworkID))
	end
	 if dude6 ~=false and deleteGunToggle ==true then 
	 Wait(0) 
	 --BOOL GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(Player player, Entity *entity) // 2975C866E6713290 8866D9D0
	dude10 = Citizen.InvokeNative(0x2975C866E6713290, dude5, Citizen.PointerValueInt(), Citizen.ResultAsString(dude10))
	dude12 = GetEntityModel(dude10)
	dude16 = GetEntityCoords(dude10)
	Citizen.Trace('entity '..tostring(dude10))
	Citizen.Trace('entity model '..tostring(dude12))
	Citizen.Trace('entity coords '..tostring(dude16))
	  isMission = IsEntityAMissionEntity(dude10)
	  isPed = IsEntityAPed(dude10)
	  isAnObj = IsEntityAnObject(dude10)
	  isVeh = IsEntityAVehicle(dude10)
	  object_to_net = ObjToNet(dude10)
	  net_to_object = NetToObj(dude10)   
	    if isMission ~=0 then
            SetEntityAsMissionEntity(dude10, true, true)
			  if isPed ~=false then
			  --BOOL GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(Player player, Entity *entity) // 2975C866E6713290 8866D9D0
			  dude10 = Citizen.InvokeNative(0x2975C866E6713290, dude5, Citizen.PointerValueInt(), Citizen.ResultAsString(dude10))
			  isMission = IsEntityAMissionEntity(dude10)
			   SetEntityAsMissionEntity(dude10, true, true)
			    delPedCoords = GetEntityCoords(dude10)
				 delPedModel = GetEntityModel(dude10)
				 DeleteEntity(dude10)
				  TriggerServerEvent('deleteGunActivity', pedDeleted, tostring(delPedCoords), delPedModel)
				 SetModelAsNoLongerNeeded(dude12)
			  end
              if isVeh ~=false then
			  --BOOL GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(Player player, Entity *entity) // 2975C866E6713290 8866D9D0
			  dude10 = Citizen.InvokeNative(0x2975C866E6713290, dude5, Citizen.PointerValueInt(), Citizen.ResultAsString(dude10))
			  isMission = IsEntityAMissionEntity(dude10)
			   SetEntityAsMissionEntity(dude10, true, true)
			    delVehCoords = GetEntityCoords(dude10)
				 delVehModel = GetEntityModel(dude10)
			    DeleteVehicle(dude10)
				DeleteEntity(dude10)
				 SetModelAsNoLongerNeeded(dude12)
			  end
			  if isAnObj ~=false then
			  --BOOL GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(Player player, Entity *entity) // 2975C866E6713290 8866D9D0
			  dude10 = Citizen.InvokeNative(0x2975C866E6713290, dude5, Citizen.PointerValueInt(), Citizen.ResultAsString(dude10))
	          isEntityNetworked = NetworkHasControlOfEntity(dude10)
	           entityNetworkID = NetworkGetNetworkIdFromEntity(dude10)
               doesEntityExist = NetworkDoesNetworkIdExist(NetworkGetNetworkIdFromEntity(dude10))
			    NetworkRequestControlOfNetworkId(entityNetworkID)
                SetEntityAsMissionEntity(dude10, 1, 0)
				SetEntityAsMissionEntity(entityNetworkID, 1, 0)
				
			  isMission = IsEntityAMissionEntity(dude10)
			    SetEntityAsMissionEntity(object_to_net, true, true)
				 SetEntityAsMissionEntity(net_to_object, true, true)
				 SetEntityAsMissionEntity(entityNetworkID, true, true)
				 object_to_net = ObjToNet(dude10)
				  net_to_object = NetToObj(entityNetworkID)
				   playerName = GetPlayerName(object_to_net, dude5, true)
			    objIndex = GetObjectIndexFromEntityIndex(dude10)
                    objCoords = GetEntityCoords(dude10)
                    objModel = 	GetEntityModel(dude10)
				DeleteEntity(object_to_net)
                 DeleteObject(net_to_object)
				  DeleteObject(dude10)
				   DeleteObject(entityNetworkID)
				    DeleteEntity(entityNetworkID)
				 SetModelAsNoLongerNeeded(GetEntityModel(entityNetworkID))				    
			  end		  
        end		
	 end
  end
end)

    SetSwimMultiplierForPlayer(dude5, 1.49)
	SetRunSprintMultiplierForPlayer(dude5, 1.49) 
RequestScaleformMovie("instructional_buttons")

--------------------------------------------------------------------------------------------------
----------------------this gets a player if they are not the current player-----------------------
--------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
     temp1 = -1
     handle = NetworkHandleFromPlayer(PlayerId(), 13)
     currentPlayerName = GetPlayerName(PlayerId())
	 playerPedID = GetPlayerPed(PlayerId())
	 playerID = PlayerId()
	 playerID = tostring(playerID)
     temp3 = {currentPlayerName, handle, playerPedID}      
	 while temp1 <=3 do
	  Citizen.Wait(10)
      temp2 = IntToPlayerindex(temp1)
	   if GetPlayerPed(temp2) ~= temp0 then         
	   end	
	   if DoesEntityExist(GetPlayerPed(temp2)) then 
	    playerModel = GetEntityModel(GetPlayerPed(temp2))
	   if not HasModelLoaded(playerModel) then 
	    RequestModel(playerModel)
	   end
	    name =  GetPlayerName(temp2)
	   else 
	   name = GetPlayerName(temp2)
	   end	   
	  temp1 = temp1+1

	  if temp1 >= 3 then 
	    temp1 = -1
	  end
	 end   
end)

Citizen.CreateThread(function()
    while true do	
     Citizen.Wait(3000)
	 --Citizen.Trace("get hash key of cinscreen: "..tostring(GetHashKey("cinscreen")))
	 --Citizen.Trace("is interior ready: "..tostring(IsInteriorReady(258561)))
	 --Citizen.Trace("playerId: "..tostring(PlayerId()))
	 --Citizen.Trace("get name of this thread: "..tostring(GetIdOfThisThread()))
	 --Citizen.Trace("Player position: "..tostring(GetEntityCoords(GetPlayerPed(PlayerId()))))
	 --Citizen.Trace("player rotation: "..tostring(GetEntityRotation(GetPlayerPed(PlayerId()))))
	 --Citizen.Trace("player ped id: "..tostring(NetworkGetPlayerIndexFromPed(PlayerPedId())))
	 --Citizen.Trace("get player ped: "..tostring(temp0))
	 --Citizen.Trace("int to player index: "..tostring(temp2))
	 --Citizen.Trace("temp1: "..tostring(temp1))
	 --Citizen.Trace("spawned entity ID: "..tostring(a))
	 --Citizen.Trace("interior ready: "..tostring(IsInteriorReady(258561)))
	 --Citizen.Trace("get closest object of type: "..tostring(GetClosestObjectOfType(GetEntityCoords(GetPlayerPed(PlayerId()), true), 20.1, stuff, 0, 0, 0)))
	 --Citizen.Trace("get network id of player: "..tostring(NetworkGetNetworkIdFromEntity(GetPlayerPed())))
	 --Citizen.Trace("current interior ID: "..tostring(GetInteriorFromEntity(GetPlayerPed(-1))))
	 --Citizen.Trace("current roomkey: "..tostring(GetRoomKeyFromEntity(GetPlayerPed(-1))))
	 --Citizen.Trace("spawned entity coords: "..tostring(GetEntityCoords(a)))
	 --Citizen.Trace("spawned entity heading: "..tostring(GetEntityHeading(a)))
	 --Citizen.Trace("spawned entity rotation: "..tostring(GetEntityRotation(a)))      
	 --Citizen.Trace("spawned entityID : "..tostring(a))
	 --Citizen.Trace("get render cam : "..tostring(renderCam))
	 --Citizen.Trace("spawned vehID : "..tostring(spawnedVeh))
	 --Citizen.Trace("has veh model loaded : "..tostring(HasModelLoaded(veh)))
	 --Citizen.Trace("spawned pedID : "..tostring(spawnPed))
	 --Citizen.Trace("does cam exist : "..tostring(DoesCamExist(26379945)))
	 --Citizen.Trace("closest entity of type: "..tostring(closestEntity))
	 --Citizen.Trace("entity roomKey: "..tostring(entityRoomKey))
	 --Citizen.Trace("entity interiorID: "..tostring(entityInteriorID))
	 --Citizen.Trace("bunker interiorID: "..tostring(bunkerInterior))	 
	 --Citizen.Trace("net to ped playerped: "..tostring(PlayerId()))
	 --Citizen.Trace("playerped: "..tostring(GetPlayerPed(PlayerId())))
	 --Citizen.Trace("interior groupID: "..tostring(interiorGroupID))
	 --Citizen.Trace("spawned entity visible: "..tostring(IsEntityVisible(a)))
	 --Citizen.Trace("spawned veh visible: "..tostring(IsEntityVisible(spawnedVeh)))
	 --Citizen.Trace("spawned ped visible: "..tostring(IsEntityVisible(spawnPed)))
     --Citizen.Trace("spawned ped variations: "..tostring(pedVariationCount))
	 --Citizen.Trace("spawned ped current variation: "..tostring(pedVariation))
	 --Citizen.Trace("spawned ped current  drawable variation: "..tostring(pedDrawableVariation))
	 --Citizen.Trace("spawned ped number of drawable variation: "..tostring(numberOfDrawableVariations))
	 --Citizen.Trace("closest pedCount: "..tostring(closestPedCount))
	 --Citizen.Trace("closest ped: "..tostring(closestPed))
	 --Citizen.Trace("closest veh: "..tostring(closestVeh))
	 --Citizen.Trace("nearby ped count: "..tostring(pedCount))
	 --Citizen.Trace("nearby peds: "..tostring(pedz))
	 --Citizen.Trace("get closest veh(buggyB): "..tostring(GetClosestVehicle(887.824, -3236.251, -98.8946, 1.0, -769147461, 70)))
     --Citizen.Trace("get closest veh(buggyA): "..tostring(GetClosestVehicle(890.708, -3236.804, -98.8961, 50.0, -769147461, 70)))
end
end)


