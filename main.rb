def Regex(address)
  # tipo
  regexTest = address.match(/([A-zà-ú]\.?)+/)
  if(regexTest)
    puts("Tipo: #{regexTest.to_s.delete("-, ")}")
    address = address.gsub(regexTest.to_s,"")
  end
  # nome
  regexTest = address.match(/\s([A-zà-ú]+\.?\s?)+/)
  if(regexTest)
    puts("Nome: #{regexTest.to_s.delete("-,")}")
    address = address.gsub(regexTest.to_s, "")
    else
      puts("Nome: N/A")
  end
  #numero
  regexTest = address.match(/\,\s([0-9]+)/)
  if(regexTest)
    puts("Número: #{regexTest.to_s.delete("-,")}")
    address = address.gsub(regexTest.to_s, "")
    else
      puts("Número: N/A")
  end
  #complemento
  regexTest = address.match(/(\,\s(([A-zà-ú]\.?\s?)+([0-9]\s?)+)+)/)
  if(regexTest)
    puts("Complemento: #{regexTest.to_s.delete("-,")}")
    address = address.gsub(regexTest.to_s, "")
  else
    puts("Complemento: N/A")
  end
  
  #bairro
  regexTest = address.match(/\-\s([A-zà-ú]\.?\s?)+/)
  if(regexTest)
    puts("Bairro: #{regexTest.to_s.delete("-,")}")
    address = address.gsub(regexTest.to_s, "")
  else
    puts("Bairro: N/A")
  end
  #cidade
  regexTest = address.match(/\,\s([A-zà-ú]\s?)+\s/)
  if(regexTest)
    puts("Cidade: #{regexTest.to_s.delete("-,")}")
    address = address.gsub(regexTest.to_s, "")
    else
      puts("Cidade: N/A")
  end
  #estado
  regexTest = address.match(/\-\s([A-Z]{2})/)
  if(regexTest)
    puts("Estado: #{regexTest.to_s.delete("-,")}")
    address = address.gsub(regexTest.to_s, "")
    else
      puts("Estado: N/A")
  end
  #cep
  regexTest = address.match(/\,\s([0-9]{5}\-?[0-9]{3})/)
  if(regexTest)
    puts("CEP: #{regexTest.to_s.delete("-,")}")
    address = address.gsub(regexTest.to_s, "")
    puts address.to_s
    else
      puts("CEP: N/A")
  end
  
end


def Print()
  text = "O endereço do SENAC é Av. Eng. Eusébio Stevaux, 823, Apto 32 - Santo Amaro, São Paulo - SP, 04696-000 ."
  text2 = "O endereço do SENAC é Av. Eng. Eusébio Stevaux, 823- Santo Amaro, São Paulo - SP, 04696-000 ."


  combined = /\b(((A|a)venida|(A|a)v)|((R|r)odovia)|((R|r)ua|(R|r))|(E|e)strada|(T|t)ravessa)\.?\s(.*)([0-9]{5}\-?[0-9]{3})\b/

  match_result = text.match(combined)

  if (match_result)
    Regex(match_result.to_s)
  else
    return "Endereço não encontrado."
  end
  
end

Print()
