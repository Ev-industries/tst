local function run(msg, matches)
if matches[1] == 'deleteme' then
local hash = 'kick:'..msg.to.id..':'..msg.from.id
     redis:set(hash, "waite")
      return '🔖User ('..msg.from.username..') you have requested to leave the group\n🔵Press /yes to confirm\nOr\n🔴Press /no to ignore'
    end

    if msg.text then
	local hash = 'kick:'..msg.to.id..':'..msg.from.id
      if msg.text:match("^/yes$") and redis:get(hash) == "waite" then
	  redis:set(hash, "ok")
	elseif msg.text:match("^/no$") and redis:get(hash) == "waite" then
	send_large_msg(get_receiver(msg), "📛Your request ignored ")
	  redis:del(hash, true)

      end
    end
	local hash = 'kick:'..msg.to.id..':'..msg.from.id
	 if redis:get(hash) then
        if redis:get(hash) == "ok" then
         channel_kick("channel#id"..msg.to.id, "user#id"..msg.from.id, ok_cb, false)
         return '❌User was kicked from ('..msg.to.title..') by deleteme service'
        end
      end
    end

return {
  patterns = {
  "^[!/#](deleteme)",
  "^/yes$",
  "^/no$"
  },
  run = run,
}
