local function run(msg, matches)
if matches[1] == 'delete' and is_momod(msg) then
local hash = 'delete:'..msg.to.id..':'..matches[2]
     redis:set(hash, "waite")
      return '🔖User ('..msg.from.username..') you have requested to delete user '..matches[2]..' \n🔵Press /yes to confirm\nOr\n🔴Press /no to ignore'
    end

    if msg.text then
	local hash = 'delete:'..msg.to.id..':'..msg.from.id
      if msg.text:match("^/yes$") and redis:get(hash) == "waite" then
	  redis:set(hash, "ok")
	elseif msg.text:match("^/no$") and redis:get(hash) == "waite" then
	send_large_msg(get_receiver(msg), "📛Your request ignored ")
	  redis:del(hash, true)

      end
    end
	local hash = 'delete:'..msg.to.id..':'..msg.from.id
	 if redis:get(hash) then
        if redis:get(hash) == "ok" then
         channel_kick("channel#id"..msg.to.id, "user#id"..msg.from.id, ok_cb, false)
         return '❌User '..matches[2]..' is deleted from ('..msg.to.title..')'
        end
      end
    end

return {
  patterns = {
  "^[!/#](delete) (.*)$",
  "^/yes$",
  "^/no$"
  },
  run = run,
}
