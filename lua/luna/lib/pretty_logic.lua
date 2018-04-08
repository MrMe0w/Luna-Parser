luna.pp:AddProcessor("pretty_logic", function(code)
  code = code:gsub("\n(%s*)([^\n]+)%sif%s?([^\n]+)", function(a, b, c)
    b = b:trim()
    c = c:trim()

    if (b != "" and c != "") then
      return "\n"..a.."if ("..c..") then "..b.." end\n"
    end
  end)

  code = code:gsub("\n([%s]*)([^%z\n]+)%sunless%s?([^%z\n]+)\n", function(a, b, c)
    b = b:trim()
    c = c:trim()

    if (b != "" and c != "") then
      return "\n"..a.."if !("..c..") then "..b.." end\n"
    end
  end)

  code = code:gsub("([^%w_])fn%s*%(%s*%)", "%1function()")
  code = code:gsub("([^%w_])fn%s", "%1function()")
  code = code:gsub("([^%w_])fn%s*%(([^%z\n]+)%)", "%1function(%2)")

  return code
end)