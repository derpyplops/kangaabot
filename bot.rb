require 'telegram_bot'
token = '637664032:AAHpnQqsys40WF4X2aWx1SWDAFOjaobWGgQ'
bot = TelegramBot.new(token: token)

# have a list of friends
# for each friend,
    # ask friend if they can give me free food at {time} at {date}
    # prompt: Y / N
    # if N OR if timeout
        # move to next friend
    # if Y
        # yay :)

bot.get_updates(fail_silently: true) do |message|
    puts "@#{message.from.username}: #{message.text}"
    command = message.get_command_for(bot)

    message.reply do |reply|
        case command
        when /start/i
            reply.text = "Hello there."
        when /greet/i
            reply.text = "Hello, #{message.from.first_name}. 🤖"
        when /admin/i
            reply.text = "Hello! Please enter the time you want: "
        
        else
            reply.text = "I have no idea what #{command.inspect} means."
        end
        puts "sending #{reply.text.inspect} to @#{message.from.username}"
        reply.send_with(bot)
    end
end
