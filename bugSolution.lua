local function foo(t, visited)
  visited = visited or {}
  for k, v in pairs(t) do
    if type(v) == "table" then
      if visited[v] then
        -- Circular reference detected
      else
        visited[v] = true
        foo(v, visited)
      end
    end
  end
end

local t = {a = 1, b = {c = 2, d = {e = 3}}}
t.b.d.f = t -- Create a circular reference
foo(t)