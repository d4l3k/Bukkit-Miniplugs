Plugin.is {
    name "InvincibleTools"
    version "0.2"
    author "d4l3k"
    description "Adds invincible tools & armor to minecraft."
}

import 'java.util.logging.Logger'
import 'java.util.logging.Level'
import 'org.bukkit.event.Event'
import 'org.bukkit.event.player.PlayerInteractEvent'
import 'org.bukkit.event.block.SignChangeEvent'
import 'org.bukkit.block.Block'
import 'org.bukkit.entity.Player'
import 'org.bukkit.ChatColor'
import 'org.bukkit.Material'
import 'org.bukkit.event.block.Action'
import 'org.bukkit.craftbukkit.block.CraftSign'
import 'org.bukkit.event.block.SignChangeEvent'
import 'org.bukkit.Location'
import 'org.bukkit.util.Vector'

#requisites
import 'org.getspout.spoutapi.SpoutManager'
import 'org.getspout.spoutapi.gui.GenericPopup'
import 'org.getspout.spoutapi.gui.GenericScrollable'
import 'org.getspout.spoutapi.gui.GenericListWidget'
import 'org.getspout.spoutapi.gui.ListWidgetItem'
import 'org.getspout.spoutapi.gui.GenericLabel'
import 'org.getspout.spoutapi.gui.WidgetAnchor'

class InvincibleTools < RubyPlugin
	def onEnable
		@items = [256,257,258,267,268,269,270,271,272,273,274,275,276,277,278,279,290,291,292,293,294,298,299,300,301,306,307,308,309,310,311,312,313,314,315,316,317,259]
		registerEvent(Event::Type::PLAYER_INTERACT, Event::Priority::Monitor) do |event|
			item = event.getItem
			if item!=nil
				if @items.include?(item.getTypeId)
					item.setDurability(-256)
				end
			end
		end
	end
	def onDisable
	end
end


