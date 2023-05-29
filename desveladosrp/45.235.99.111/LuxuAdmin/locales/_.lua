Locales = {}

function Locale(category, key)
      local lang = Locales[Config.Locale]
      if not lang or not lang[category] then return "Lang Doesn't Exist" end
      return lang[category][key] or key
end

exports('GetLocales', function()
      return Locales
end)
