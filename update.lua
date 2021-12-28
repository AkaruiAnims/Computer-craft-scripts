--  get all the pastebin things in here to update all the code bases
local bankOS = "hpkE2Avv"

fs.delete("bankOS.lua")

shell.run("pastebin", "get", bankOS, "bankOS")
