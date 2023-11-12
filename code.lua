local blockedFunctions = {
    'outputChatBox',
    'function',
    'triggerEvent',
    'triggerClientEvent',
    'triggerServerEvent',
    'setElementData',
    'addEvent',
    'addEventHandler',
    'addDebugHook',
    'createExplosion',
    'createProjectile',
    'setElementPosition',
}

function onPreFunction( sourceResource, functionName, isAllowedByACL, luaFilename, luaLineNumber, text )
    for i, v in ipairs(blockedFunctions) do
        if text:find(v) then
			triggerServerEvent('hileci:var', localPlayer)
            break
        end
    end
end



function checkLoadString ( )
    addDebugHook( "preFunction", onPreFunction, {"loadstring"} )
	print('baslatildi')
end

addEventHandler("onClientResourceStart", resourceRoot, checkLoadString)