dofile "$SURVIVAL_DATA/Scripts/game/SurvivalGame.lua"

Game = class( SurvivalGame )

function Game.server_onCreate( self )
    SurvivalGame.server_onCreate( self )
	print("Game.server_onCreate")
end

function Game.loadCraftingRecipes( self ) LoadCraftingRecipes({ craftbot = "$CONTENT_DATA/CraftingRecipes/craftbot.json" }) end

function SurvivalGame.bindChatCommands( self )


    g_survivalDev = true
	local addCheats = g_survivalDev

	if addCheats then
		sm.game.bindChatCommand( "/ammo", { { "int", "quantity", true } }, "cl_onChatCommand", "Give ammo (default 50)" )
		sm.game.bindChatCommand( "/spudgun", {}, "cl_onChatCommand", "Give the spudgun" )
		sm.game.bindChatCommand( "/gatling", {}, "cl_onChatCommand", "Give the potato gatling gun" )
		sm.game.bindChatCommand( "/shotgun", {}, "cl_onChatCommand", "Give the fries shotgun" )
		sm.game.bindChatCommand( "/sunshake", {}, "cl_onChatCommand", "Give 1 sunshake" )
		sm.game.bindChatCommand( "/baguette", {}, "cl_onChatCommand", "Give 1 revival baguette" )
		sm.game.bindChatCommand( "/keycard", {}, "cl_onChatCommand", "Give 1 keycard" )
		sm.game.bindChatCommand( "/powercore", {}, "cl_onChatCommand", "Give 1 powercore" )
		sm.game.bindChatCommand( "/components", { { "int", "quantity", true } }, "cl_onChatCommand", "Give <quantity> components (default 10)" )
		sm.game.bindChatCommand( "/glowsticks", { { "int", "quantity", true } }, "cl_onChatCommand", "Give <quantity> components (default 10)" )
		sm.game.bindChatCommand( "/tumble", { { "bool", "enable", true } }, "cl_onChatCommand", "Set tumble state" )
		sm.game.bindChatCommand( "/god", {}, "cl_onChatCommand", "Mechanic characters will take no damage" )
		sm.game.bindChatCommand( "/respawn", {}, "cl_onChatCommand", "Respawn at last bed (or at the crash site)" )
		sm.game.bindChatCommand( "/encrypt", {}, "cl_onChatCommand", "Restrict interactions in all warehouses" )
		sm.game.bindChatCommand( "/decrypt", {}, "cl_onChatCommand", "Unrestrict interactions in all warehouses" )
		sm.game.bindChatCommand( "/limited", {}, "cl_onChatCommand", "Use the limited inventory" )
		sm.game.bindChatCommand( "/unlimited", {}, "cl_onChatCommand", "Use the unlimited inventory" )
		sm.game.bindChatCommand( "/ambush", { { "number", "magnitude", true }, { "int", "wave", true } }, "cl_onChatCommand", "Starts a 'random' encounter" )
		--sm.game.bindChatCommand( "/recreate", {}, "cl_onChatCommand", "Recreate world" )
		sm.game.bindChatCommand( "/timeofday", { { "number", "timeOfDay", true } }, "cl_onChatCommand", "Sets the time of the day as a fraction (0.5=mid day)" )
		sm.game.bindChatCommand( "/timeprogress", { { "bool", "enabled", true } }, "cl_onChatCommand", "Enables or disables time progress" )
		sm.game.bindChatCommand( "/day", {}, "cl_onChatCommand", "Disable time progression and set time to daytime" )
		sm.game.bindChatCommand( "/spawn", { { "string", "unitName", true }, { "int", "amount", true } }, "cl_onChatCommand", "Spawn a unit: 'woc', 'tapebot', 'totebot', 'haybot'" )
		sm.game.bindChatCommand( "/harvestable", { { "string", "harvestableName", true } }, "cl_onChatCommand", "Create a harvestable: 'tree', 'stone'" )
		sm.game.bindChatCommand( "/cleardebug", {}, "cl_onChatCommand", "Clear debug draw objects" )
		sm.game.bindChatCommand( "/export", { { "string", "name", false } }, "cl_onChatCommand", "Exports blueprint $SURVIVAL_DATA/LocalBlueprints/<name>.blueprint" )
		sm.game.bindChatCommand( "/import", { { "string", "name", false } }, "cl_onChatCommand", "Imports blueprint $SURVIVAL_DATA/LocalBlueprints/<name>.blueprint" )
		sm.game.bindChatCommand( "/starterkit", {}, "cl_onChatCommand", "Spawn a starter kit" )
		sm.game.bindChatCommand( "/mechanicstartkit", {}, "cl_onChatCommand", "Spawn a starter kit for starting at mechanic station" )
		sm.game.bindChatCommand( "/pipekit", {}, "cl_onChatCommand", "Spawn a pipe kit" )
		sm.game.bindChatCommand( "/foodkit", {}, "cl_onChatCommand", "Spawn a food kit" )
		sm.game.bindChatCommand( "/seedkit", {}, "cl_onChatCommand", "Spawn a seed kit" )
		sm.game.bindChatCommand( "/die", {}, "cl_onChatCommand", "Kill the player" )
		sm.game.bindChatCommand( "/sethp", { { "number", "hp", false } }, "cl_onChatCommand", "Set player hp value" )
		sm.game.bindChatCommand( "/setwater", { { "number", "water", false } }, "cl_onChatCommand", "Set player water value" )
		sm.game.bindChatCommand( "/setfood", { { "number", "food", false } }, "cl_onChatCommand", "Set player food value" )
		sm.game.bindChatCommand( "/aggroall", {}, "cl_onChatCommand", "All hostile units will be made aware of the player's position" )
		sm.game.bindChatCommand( "/goto", { { "string", "name", false } }, "cl_onChatCommand", "Teleport to predefined position" )
		sm.game.bindChatCommand( "/raid", { { "int", "level", false }, { "int", "wave", true }, { "number", "hours", true } }, "cl_onChatCommand", "Start a level <level> raid at player position at wave <wave> in <delay> hours." )
		sm.game.bindChatCommand( "/stopraid", {}, "cl_onChatCommand", "Cancel all incoming raids" )
		sm.game.bindChatCommand( "/disableraids", { { "bool", "enabled", false } }, "cl_onChatCommand", "Disable raids if true" )
		sm.game.bindChatCommand( "/camera", {}, "cl_onChatCommand", "Spawn a SplineCamera tool" )
		sm.game.bindChatCommand( "/noaggro", { { "bool", "enable", true } }, "cl_onChatCommand", "Toggles the player as a target" )
		sm.game.bindChatCommand( "/killall", {}, "cl_onChatCommand", "Kills all spawned units" )

		sm.game.bindChatCommand( "/printglobals", {}, "cl_onChatCommand", "Print all global lua variables" )
		sm.game.bindChatCommand( "/clearpathnodes", {}, "cl_onChatCommand", "Clear all path nodes in overworld" )
		sm.game.bindChatCommand( "/enablepathpotatoes", { { "bool", "enable", true } }, "cl_onChatCommand", "Creates path nodes at potato hits in overworld and links to previous node" )

		sm.game.bindChatCommand( "/activatequest",  { { "string", "name", true } }, "cl_onChatCommand", "Activate quest" )
		sm.game.bindChatCommand( "/completequest",  { { "string", "name", true } }, "cl_onChatCommand", "Complete quest" )

		sm.game.bindChatCommand( "/settilebool",  { { "string", "name", false }, { "bool", "value", false } }, "cl_onChatCommand", "Set named tile value at player position as a bool" )
		sm.game.bindChatCommand( "/settilefloat",  { { "string", "name", false }, { "number", "value", false } }, "cl_onChatCommand", "Set named tile value at player position as a floating point number" )
		sm.game.bindChatCommand( "/settilestring",  { { "string", "name", false }, { "string", "value", false } }, "cl_onChatCommand", "Set named tile value at player position as a bool" )
		sm.game.bindChatCommand( "/printtilevalues",  {}, "cl_onChatCommand", "Print all tile values at player position" )
		sm.game.bindChatCommand( "/reloadcell", {{ "int", "x", true }, { "int", "y", true }}, "cl_onChatCommand", "Reload cells at self or {x,y}" )
		sm.game.bindChatCommand( "/tutorialstartkit", {}, "cl_onChatCommand", "Spawn a starter kit for building a scrap car" )






	end
end