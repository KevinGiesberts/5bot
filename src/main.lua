local env = require('envVars')
local discordia = require('discordia')
local client = discordia.Client()

discordia.extensions()

local jamCol = 0xFFBC80 -- Jam color, use for the `color` paremeter of the embed

client:on('ready', function()
	print('Logged in as '.. client.user.username .. "#" .. client.user.discriminator)
end)

client:on('messageCreate', function(message)
    if message.author.bot then return end
    if string.sub(message.content, 1, 2) == "5!" then -- Check for prefix "5!"
        local cmd = message.content:sub(3) -- Remove prefix "5!"
        
        -- Commands will be here for now
            if cmd == 'jamlink' then
                message:reply {
                    embed = {
                        title = "5YLJ Link",
                        url = "https://itch.io/jam/5-year-long-jam",
                        color = jamCol
                    }
                }
            end

            if cmd == 'help' then
                message:reply {
                    embed = {
                        title = "Help",
                        fields = {
                            {
                                name = "Commands",
                                value = "`jamlink` - Get the link to the 5YL Jam\n`help` - Get this message\n`avatar` - Get your own avatar",
                                inline = true
                            }
                        },
                        footer = { text = "Prefix: 5!" },
                        color = jamCol
                    }
                }
            end   
            
            if cmd == 'avatar' then 
                message:reply {
                    embed = {
                        title = "Your Avatar",
                        image = { url = message.author.avatarURL } ,
                        color = jamCol
                    }
                }
            end

	end
end)

client:run("Bot ".. env.TOKEN) -- You need the "Bot" prefix before the token to login btw