def avisa_chute_efetuado(chute)
  puts "Voce já chutou #{chute}"
end

def avisa_campeao_atual(dados)
  puts "Nosso campeao atual é #{dados[0]} com #{dados[1]} pontos."
end

def avisa_pontos_totais(pontos_totais)
  puts "Voce possui #{pontos_totais} pontos."
end

def avisa_acertou_palavra
  puts "Parabens! acertou!"
end

def avisa_errou_palavra
  puts "Que pena... errou"
end

def avisa_pontos(pontos_ate_agora)
  puts "Voce ganhou #{pontos_ate_agora} pontos."
end

def avisa_letra_encontrada_numero_vezes(total_encontrado)
  puts "Letra encontrada #{total_encontrado} vezes!"
end

def avisa_letra_nao_encontrada
  puts "Letra nao encontrada"
end

def da_boas_vindas
  puts "Bem vindo ao jogo da forca"
  puts "Qual o seu nome?"
  nome = gets.strip
  puts "\n\n\n\n\n\n"
  puts "Vamos comercar a jogar!"
end


def nao_quer_jogar
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip
  nao_quer_jogar = quero_jogar.upcase == "N"
end

def cabecalho_de_tentativas(chutes, erros, mascara)
  puts "\n\n\n\n"
  puts "Palavra Secreta #{mascara}"
  puts "Erros até agora: #{erros}"
  puts "Chutes até agora: #{chutes}"
end

def pede_um_chute
  puts "Entre com uma letra ou palavra:"
  chute = gets.strip.downcase
  puts "Sera que acertou? Voce chutou #{chute}"
  chute
end

def avisa_escolhendo_palavra
  puts "Escolhendo Palavra secreta...."
end

def avisa_palavra_escolhida(palavra_secreta)
  puts "Palavra secreta com #{palavra_secreta.size} letras... boa sorte!" #.size para  ver tamanho da palavra
  palavra_secreta
end

