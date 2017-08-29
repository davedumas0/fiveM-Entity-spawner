

---------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------put entity name or hash here---------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
function things(modelHash)
   stuff = modelHash
end
----------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------this sets delete gun toggle to off --------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
 deleteGunToggle = false
----------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------this gets info about spawned entity and player----------------------------------------
----------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)
  local playerCoords = GetEntityCoords(GetPlayerPed(PlayerId()), true)	  
  local position = "player Coords X "..playerCoordsX
  local offset = {x = 0.290, y = 0.850}
  local rgb = {r = 255, g = 0, b = 0}
  local alpha = 255
  local scale = 0.6
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
end)

Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)
  local playerCoords = GetEntityCoords(GetPlayerPed(PlayerId()), true)	  
  local position = "player Coords Y "..playerCoordsY
  local offset = {x = 0.290, y = 0.875}
  local rgb = {r = 255, g = 0, b = 0}
  local alpha = 255
  local scale = 0.6
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
end)
Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)
  local playerCoords = GetEntityCoords(GetPlayerPed(PlayerId()), true)	  
  local position = "player Coords Z "..playerCoordsZ
  local offset = {x = 0.290, y = 0.900}
  local rgb = {r = 255, g = 0, b = 0}
  local alpha = 255
  local scale = 0.6
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
end)
Citizen.CreateThread(function()	
  while true do
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
	 
-----------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------this checks if the spawned entity exists and moves it as player pushes buttons---------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
	if not DoesEntityExist(a) or DoesEntityExist(GetClosestObjectOfType(playerCoordsX, playerCoordsY, playerCoordsZ, 50.0, stuff, 0, 1, 0)) then
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
	 if IsControlPressed(0, 213) then
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
	if not HasModelLoaded(stuff) then
	 Citizen.Wait(0)
	 RequestModel(stuff)
--if model is a veh then spawn a veh	 
	end
	if IsModelAVehicle(stuff) then 
	 spawnedVeh = CreateVehicle(stuff, playerCoordsX, playerCoordsY, playerCoordsZ, playerHeading, 0, 0, 0)
	end
--spawn the object	
	a = ObjToNet(CreateObjectNoOffset(stuff, playerCoordsX+1, playerCoordsY+1, playerCoordsZ, 1, 0, 0))
	setCollisionStuff(true)
    freezeStuff()
  SetEntityHeading(a, playerHeading)
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
	 Citizen.Trace(''..tostring(dude10))
	 Citizen.Trace(''..tostring(GetEntityModel(dude10)))
	 Citizen.Trace(''..tostring(GetEntityCoords(dude10)))	 
	end
	 if dude6 ~=false and deleteGunToggle ==true then 
	 Wait(0) 
	 --BOOL GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(Player player, Entity *entity) // 2975C866E6713290 8866D9D0
	dude10 = Citizen.InvokeNative(0x2975C866E6713290, dude5, Citizen.PointerValueInt(), Citizen.ResultAsString(dude10))
	dude12 = GetEntityModel(dude10)
	dude16 = GetEntityCoords(dude10)
	Citizen.Trace(''..tostring(dude10))
	Citizen.Trace(''..tostring(dude12))
	Citizen.Trace(''..tostring(dude16))
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
			  isMission = IsEntityAMissionEntity(dude10)
			    SetEntityAsMissionEntity(object_to_net, true, true)
				 SetEntityAsMissionEntity(net_to_object, true, true)
				 object_to_net = ObjToNet(dude10)
				  net_to_object = NetToObj(object_to_net)
				   playerName = GetPlayerName(object_to_net, dude5, true)
			    objIndex = GetObjectIndexFromEntityIndex(dude10)
                    objCoords = GetEntityCoords(dude10)
                    objModel = 	GetEntityModel(dude10)
				DeleteEntity(object_to_net)
                 DeleteEntity(net_to_object)
				 SetModelAsNoLongerNeeded(dude12)				    
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
     
     currentPlayerName = GetPlayerName(PlayerId())
     temp3 = {currentPlayerName, handle}
     temp0 = GetPlayerPed(PlayerId())
     temp1 = -1
	 while temp1 <=3 do
	  Citizen.Wait(10000)
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
	  
	  handle = NetworkHandleFromPlayer(temp1, 13)
	  temp1 = temp1+1
--	  Citizen.Trace("current playerID: "..tostring(PlayerId()))
--	  Citizen.Trace("current player ped ID: "..tostring(temp0))
--	  Citizen.Trace("iterator: "..tostring(temp1))	  
--	  Citizen.Trace("player pedID: "..tostring(GetPlayerPed(temp2)))
--	  Citizen.Trace("player name: "..tostring(name))
--	  Citizen.Trace("handle: "..tostring(handle))
--	  Citizen.Trace("is r* banned: "..tostring(IsSocialclubBanned()))
	  if temp1 >= 3 then 
	    temp1 = -1
	  end
	 end   
end)
