M = {}
--Definiert zwei Lua Tables die das Alphabet in gross und klein enthalten
AlphabetSmall = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
AlphabetLarge = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
M.HoppedLetter = {}

--Findet die Position eines Buchstaben im Alphabet und returned sonst 0
M.AlphabetPosition = function (char)

  --Sucht im grossen Alphabet
  for i, v in pairs(AlphabetLarge) do

    if v == char then

      return(i)

    end
  end

  --Sucht im kleinen Alphabet
  for i, v in pairs(AlphabetSmall) do

    if v == char then

      return(i)

    end
  end

  return(0)

end

-- Findet letztes element im Text
M.HoppedLetter.LastInText = function(textlänge, intext)

	-- Für Temporäre variable
	Teva = 0

	for keys, values in pairs(M.HoppedLetter) do 

		if keys > textlänge and intext == true then

			return keys 

		end
		if keys > Teva then

			Teva = keys

		end
	end

	return keys

end


M.CheckForDoubles = function (pos)

  --Überprüft ob der gleiche Buchstabe (gemessen an position, da sich diese im Text nicht doppeln) schon mal von einer Ausführung der der Hop Funktion betroffen war
  if M.HoppedLetter[pos] == true then

    return true

  else

    M.HoppedLetter[pos] = true

  end
end


--Eine recursive Funktion die das Spiel für einen Spieler simuliert
M.Hop = function (start_pos, hoplen, last_letter, text)

  --Für bessere Lesbarkeit definiere ich diese Variablen
  local current_letter = string.sub(text, start_pos, start_pos)
  local letter_index = M.AlphabetPosition(current_letter)


  if start_pos > string.len(text) then

    if M.CheckForDoubles(start_pos + hoplen) then

	  --gibt die Debuginformation wenn sich die Springer nach dem Text erst überkreuzen (ist wichtig wenn der Text noch nicht zuende geschrieben ist
      print("Die Hopper werden sich an Position '", start_pos + hoplen, "' überlappen. Ändere den Buchstaben '", string.sub(text, M.HoppedLetter.LastInText(), M.HoppedLetter.LastInText()) , "' an Position '", M.HoppedLetter.LastInText(), "'.")

      return("Done")

    end

    print("Der nächste Buchstabensprung findet an Buchstabenposition", start_pos +  hoplen ,"in", start_pos + hoplen - string.len(text), " Buchstaben")
    return("Also Done")

  end

  --Hier teste ich ob der Buchstabe bei dem sich das Programm befindet im 24 Buchstaben Alphabet befindet
  if letter_index ~= 0 then

    --hier teste ich ob ich now einen weiteren Buchstaben gehen muss oder ob ein weiterer Sprung passiert 
    if hoplen == 0 then

      --TODO: Put anything that hshould happen to hopped numbers here 

      if M.CheckForDoubles(start_pos) then

		--wenn sich die Springer überlappen wird es dem Nutzer mitgeteilt
        print("The Hoppers overlap at Letter'", current_letter, "' at Position '", start_pos, "'. Fix the Letter '", string.sub(text, last_letter, last_letter ) , "' at Position '", last_letter, "'.")


      else

		--sollten sich die Springer nicht überlappen machen wir einen weiteren Sprung
        return(M.Hop(start_pos, letter_index, start_pos, text))

      end
    else

      --Wenn wir noch im prozess des springen sind und die Sprungweite noch nicht erreicht ist 
      return(M.Hop(start_pos + 1, hoplen - 1, last_letter, text))

    end
  else

    --Wenn der geradige Symbol nicht im Alphabet ist wird er ignoriert und es wird zum nächsten symbol gegangen
    return(M.Hop(start_pos + 1, hoplen, last_letter, text))

  end
end

M.Reset = function()

	--setzt den Zustand der variablen zurück damit das Plugin nochmal laufen kann
	M.HoppedLetter = {}

end


M.Configs = function ()

	M.Con = false
	--setzt einen Hotkey der die Main Funktion ruft dieser ist der Leader key (bei meinem setup <space>) + "h" + "h"
	vim.keymap.set("n","<leader>hh", function()
		M.Main()
	end)

end


M.Main = function ()

	M.Text = table.concat(vim.api.nvim_buf_get_lines(0,0,vim.api.nvim_buf_line_count(0),true))
	M.Hop(1,0,1,M.Text)
	M.Hop(2,0,2,M.Text)
	M.Reset()

end


return M
