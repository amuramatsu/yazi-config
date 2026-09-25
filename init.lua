if ya.target_family() == "unix" then
  local child, err = Command("set_eaw"):stdout(Command.INHERIT):spawn()
  if not err then
    child:wait()
  end
end

function Linemode:size_and_mtime()
  local time = math.floor(self._file.cha.mtime or 0)
  if time == 0 then
    time = ""
  elseif os.date("%Y", time) == os.date("%Y") then
    time = os.date("%m%dT%H%M", time)
  else
    time = os.date(" %Y%m%d", time)
  end
  
  local size = self._file:size()
  return string.format("%s %s", size and ya.readable_size(size) or "-", time)
end

require("term-cwd"):setup()

