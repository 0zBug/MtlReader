return function(File)
	local Materials = {}
	local Material
	
	for _, Line in next, string.split(readfile(File), "\n") do
		if string.sub(string.gsub(Line, " ", ""), 1, 6) == "newmtl" then
			Material = string.match(Line, "newmtl (.+)")
	
			Materials[Material] = {}
		elseif string.sub(string.gsub(Line, " ", ""), 1, 6) == "map_Kd" then
			Materials[Material] = string.match(Line, "map_Kd (.+)\.png") .. ".png"
		end
	end

  return Materials
end
