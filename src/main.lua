local env = require('envVars')
local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)
    if message.author.bot then return end

    if string.sub(message.content, 1, 2) == "5!" then -- Check for prefix "5!"
        local cmd = message.content:sub(3) -- Remove prefix "5!"
        print(cmd)

        -- Commands will be here for now
            if cmd == 'ping' then
                message.channel:send('Pong!')
            end
	end
end)

client:run("Bot ".. env.TOKEN) -- You need the "Bot" prefix before the token to login btwluvi