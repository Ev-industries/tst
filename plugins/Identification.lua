do
function run(msg, matches)
  if matches[1] == 'userid' then
return "#⃣User info\n┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅\nℹ️Status∶Recognized✔\n┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅\n📍FirstName | "..msg.from.first_name.."\n📍Username | @"..msg.from.username.."\n📍Identification | "..msg.from.id.."\n📍UserLink | t.me/"..msg.from.username..""
end
  if matches[1] == 'gpid' then
return "#⃣Group info\n┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅\nℹ️Status∶Moderated✔\n┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅\n📍GroupName | "..msg.to.title.."\n📍Identification | "..msg.to.id.."\n📍UserName | Not available in your region"  
end
  if matches[1] == 'msgid' then
return "#⃣Message info\n┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅\nℹ️Status∶Sent✔\n┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅\n📍Message text | "..msg.text.."\n📍Identification | "..msg.id..""
end
end
return {
  patterns = {
    "^[!#/](.*)$",
  },
  run = run
}
end
