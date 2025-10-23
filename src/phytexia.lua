latex = tex;

-- Function that takes an input
function mtggeneric (input_string)
  -- Check if the input was just a positive non-decimal number.
  if string.match(input_string, "^%d+$") then

    -- If so, parse it
    local input_number = tonumber(input_string)

    -- Check if it's in the allowed range.
  	if ((0 <= input_number
  	and input_number <= 20)
  	or input_number == 100
  	or input_number == 1000000)
  	then
      -- Print its generic mana symbol.
    	latex.sprint(
    		"\\makeatletter\\mtg@symbol{symbols/",
    		input_string,
    		"}\\makeatother"
    	);
    else
      -- If it's not in the allowed number range, throw an error.
      latex.error("Illegal numeric input for amount of generic mana");
    end
  -- Now, check for the 3 allowed non-number amounts.
  elseif input_string == "X"
  	or input_string == "Y"
  	or input_string == "Z"
  	then
  	-- And print their symbol.
  	latex.sprint(
  		"\\makeatletter\\mtg@symbol{symbols/",
  		input_string,
  		"}\\makeatother"
  	);
  else
    -- In all other cases, just throw an error.
    latex.error("Illegal non-numeric input for amount of generic mana");
  end
end

function mtgcost (input_string)
  -- After putting the input in a lua variable, we begin by replacing the color shorthands with long-form words. This allows us to replace them with the commands later on, while avoiding the problem of double replacements (as these commands contain the shorthands again).
	input_string = input_string:gsub("W"                    ,"white")
	input_string = input_string:gsub("U"                    ,"blue")
	input_string = input_string:gsub("B"                    ,"black")
	input_string = input_string:gsub("R"                    ,"red")
	input_string = input_string:gsub("G"                    ,"green")
	input_string = input_string:gsub("C"                    ,"colorless")
  -- In particular, the raw |P| for a Phyrexian alternative cost only appears with other colors.
  -- In this combination, |P| still means Phyrexian and not Paw.
	input_string = input_string:gsub("/P"                   ,"/phyrexian")
	input_string = input_string:gsub("T"                    ,"tap")
	input_string = input_string:gsub("Q"                    ,"untap")
	input_string = input_string:gsub("E"                    ,"energy")
	input_string = input_string:gsub("A"                    ,"acorn")
  -- A |P| without a |/| before it however must always be a pawprint symbol.
  -- Confusingly, Wizards chose to have this one letter do double duty.
	input_string = input_string:gsub("P"                    ,"paw")
  -- A |P| used to denote Phyrexian mana of any color, but since Wizards wants to use |P| for the paw symbol, that is now represented by |H| instead.
	input_string = input_string:gsub("H"                    ,"cphyrexian")
  -- After that, the actual replacement can continue without problems.
	input_string = input_string:gsub("2/white"              ,"\\mtgTwoW")
	input_string = input_string:gsub("2/blue"               ,"\\mtgTwoU")
	input_string = input_string:gsub("2/black"              ,"\\mtgTwoB")
	input_string = input_string:gsub("2/red"                ,"\\mtgTwoR")
	input_string = input_string:gsub("2/green"              ,"\\mtgTwoG")
	input_string = input_string:gsub("white/blue/phyrexian" ,"\\mtgWUP")
	input_string = input_string:gsub("white/black/phyrexian","\\mtgWBP")
	input_string = input_string:gsub("red/white/phyrexian"  ,"\\mtgRWP")
	input_string = input_string:gsub("green/white/phyrexian","\\mtgGWP")
	input_string = input_string:gsub("blue/black/phyrexian" ,"\\mtgUBP")
	input_string = input_string:gsub("blue/red/phyrexian"   ,"\\mtgURP")
	input_string = input_string:gsub("green/blue/phyrexian" ,"\\mtgGUP")
	input_string = input_string:gsub("black/red/phyrexian"  ,"\\mtgBRP")
	input_string = input_string:gsub("black/green/phyrexian","\\mtgBGP")
	input_string = input_string:gsub("red/green/phyrexian"  ,"\\mtgRGP")
	input_string = input_string:gsub("white/blue"           ,"\\mtgWU")
	input_string = input_string:gsub("white/black"          ,"\\mtgWB")
	input_string = input_string:gsub("red/white"            ,"\\mtgRW")
	input_string = input_string:gsub("green/white"          ,"\\mtgGW")
	input_string = input_string:gsub("blue/black"           ,"\\mtgUB")
	input_string = input_string:gsub("blue/red"             ,"\\mtgUR")
	input_string = input_string:gsub("green/blue"           ,"\\mtgGU")
	input_string = input_string:gsub("black/red"            ,"\\mtgBR")
	input_string = input_string:gsub("black/green"          ,"\\mtgBG")
	input_string = input_string:gsub("red/green"            ,"\\mtgRG")
	input_string = input_string:gsub("white/phyrexian"      ,"\\mtgWP")
	input_string = input_string:gsub("blue/phyrexian"       ,"\\mtgUP")
	input_string = input_string:gsub("black/phyrexian"      ,"\\mtgBP")
	input_string = input_string:gsub("red/phyrexian"        ,"\\mtgRP")
	input_string = input_string:gsub("green/phyrexian"      ,"\\mtgGP")
	input_string = input_string:gsub("colorless/white"      ,"\\mtgCW")
	input_string = input_string:gsub("colorless/blue"       ,"\\mtgCU")
	input_string = input_string:gsub("colorless/black"      ,"\\mtgCB")
	input_string = input_string:gsub("colorless/red"        ,"\\mtgCR")
	input_string = input_string:gsub("colorless/green"      ,"\\mtgCG")
	input_string = input_string:gsub("white"                ,"\\mtgW")
	input_string = input_string:gsub("blue"                 ,"\\mtgU")
	input_string = input_string:gsub("black"                ,"\\mtgB")
	input_string = input_string:gsub("red"                  ,"\\mtgR")
	input_string = input_string:gsub("green"                ,"\\mtgG")
	input_string = input_string:gsub("colorless"            ,"\\mtgC")
	input_string = input_string:gsub("untap"                ,"\\mtgQ")
	input_string = input_string:gsub("tap"                  ,"\\mtgT")
	input_string = input_string:gsub("energy"               ,"\\mtgE")
	input_string = input_string:gsub("acorn"                ,"\\mtgA")
	input_string = input_string:gsub("paw"                  ,"\\mtgP")
	input_string = input_string:gsub("cphyrexian"           ,"\\mtgH")
  -- For generic mana, we need to perform a regex match to catch all possible numbers after replacing X regularly.
	input_string = input_string:gsub("X"                    ,"\\mtggeneric{X}")
	input_string = input_string:gsub("Y"                    ,"\\mtggeneric{Y}")
	input_string = input_string:gsub("Z"                    ,"\\mtggeneric{Z}")
	input_string = input_string:gsub("%d+"                  ,"\\mtggeneric{%1}")
  -- Finally, we just put the replaced string back again.
	latex.sprint(input_string)
end

function mtgcard(input_string)
  local info = get_card_data(input_string)
  latex.sprint("\\href{")
  latex.sprint(info["scryfall_uri"]);
  latex.sprint("}{")
  latex.sprint(info["name"]);
  latex.sprint("}")
end

function mtgcardcost(input_string)
  local info = get_card_data(input_string)
  mtgcost(info["mana_cost"])
end

function mtgcardimg(input_string)
  local info = get_card_data(input_string)
  latex.sprint(info["artist"]);
end


local last_api_call = 0

function get_card_data(input_string)
  -- Wait to not send to many requests.
  while os.clock() < last_api_call + 0.01 do end
  last_api_call = os.clock()

  -- Create the basis for the request string.
  local url = "https://api.scryfall.com/cards/named?"

  -- Check if the input_string contains a set code.
  local barpos = input_string:find("|");
  if barpos == nil then
    -- If no, the entire input is the name.
    url = url
      .. "fuzzy="
      .. input_string:gsub(" ", "+")
  else
    -- If yes, split the string into name and set.
    local name = input_string:sub(1,barpos-1):gsub(" ", "+")
    local set = input_string:sub(barpos+1)
    url = url
      .. "fuzzy="
      .. name
      .. "&set="
      .. set
  end

  -- Get the data via curl over the command line.
  -- Requires shell-escape
  local curl_data = io.popen ("curl -A \"PhyTeXia/1.0\" -s -k \"".. url .."\"")

  local info = nil

  -- check if io.popen worked
  if curl_data then
      info = curl_data:read ("*a")  -- read entire file into string

      -- check if we got something
      if (not info) or (#info == 0) then
         info = nil                -- empty string
      end

      io.close (curl_data)   -- close the file (pipe)
      curl_data = nil              -- (in case not global, remove stale data)
   else
      latex.error(string.format("Could not find card %s.", input_string))
      return 0
   end

   -- parse to JSON
   local json = require "json"
   local info_parsed = json.parse(info)

   if (info_parsed == 0) then
     latex.error(string.format("Could not parse information for card %s.", input_string))
     return 0
   end

   return info_parsed
end
