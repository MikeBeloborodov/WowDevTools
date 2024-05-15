-- Util functions

function Print(msg, r, g, b)
	DEFAULT_CHAT_FRAME:AddMessage(msg, r, g, b)
end

function PrintRed(msg)
	Print(msg, 1.0, 0.2, 0.2)
end

function PrintWhite(msg)
	Print(msg, 1.0, 1.0, 1.0)
end

-- Reload UI

SLASH_RELOAD1 = "/reload"
SlashCmdList["RELOAD"] = function (msg)
	ReloadUI();
end

-- All events

local eventsFrame = CreateFrame('Frame')
eventsFrame:UnregisterAllEvents()
eventsFrame.IsOn = false
eventsFrame:SetScript('OnEvent',
    function()
		PrintWhite(event)
    end
)

SLASH_EVENTS1 = "/events"
SlashCmdList["EVENTS"] = function (msg)
	if eventsFrame.IsOn then
		eventsFrame.IsOn = false
		eventsFrame:UnregisterAllEvents()
	else
		eventsFrame.IsOn = true
		eventsFrame:RegisterAllEvents()
	end
end

-- Get frame name on failed spellcast

local getWidgetsFrame = CreateFrame("Frame")
getWidgetsFrame.IsOn = false
getWidgetsFrame:SetScript("OnEvent",
	function()
		local frameId = GetMouseFocus():GetName()
		PrintRed(frameId)
	end
)

SLASH_WIDGETS1 = "/widgets"
SlashCmdList["WIDGETS"] = function (msg)
	if getWidgetsFrame.IsOn then
		getWidgetsFrame.IsOn = false
		getWidgetsFrame:UnregisterEvent("SPELLCAST_FAILED")
	else
		getWidgetsFrame.IsOn = true
		getWidgetsFrame:RegisterEvent("SPELLCAST_FAILED")
	end
end
