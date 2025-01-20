-- very old dk if works

local webhooks = { "discord.com/api/webhooks", "discordapp.com/api/webhooks" }
local request = http_request or request or HttpPost or syn and syn.request or http and http.request

rconsolename("swow's anti-webhook")
rconsolewarn("anti-webhook loaded")
rconsolewarn("blocks & deletes any webhook logging attempts")
webhookdetect = hookfunction(request, function(self)
    if self.Method and self.Method == "POST" and self.Url and not table.find(webhooks, self.Url) then
        rconsolewarn("webhook request blocked & webhook deleted")
        request{ Url = self.Url, Method = "DELETE" }
        self.Url = ""
    end
    return webhookdetect(self)
end)

