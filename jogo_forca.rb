require_relative 'ui'
require_relative 'rank'

def escolhe_palavra_secreta
  avisa_escolhendo_palavra()
  texto = File.read("dicionario.txt")
  todas_as_palavras = texto.split "\n"
  numero_escolhido = rand(todas_as_palavras.size)
  palavra_secreta = todas_as_palavras[numero_escolhido].downcase
 avisa_palavra_escolhida(palavra_secreta)
end


def escolhe_palavra_secreta_sem_consumir_muita_memoria
  avisa_escolhendo_palavra()
  arquivo = File.new("dicionario.txt")
  quantidade_de_palavras = arquivo.gets.to_i
  numero_escolhido = rand(quantidade_de_palavras)
  for linha in 1 .. (numero_escolhido - 1)
    arquivo.gets
  end
  palavra_secreta = arquivo.gets.strip.downcase
  arquivo.close
  avisa_palavra_escolhida(palavra_secreta)
end

def define_palavra_mascarada(chutes, palavra_secreta)
  mascara = ""
  for letra in palavra_secreta.chars #transforma em array de caracteres
    if chutes.include? letra
      mascara << letra
    else
      mascara << "_"
    end
  end
  mascara
end

def pede_um_chute_valido(chutes, erros, mascara)
  cabecalho_de_tentativas(chutes, erros, mascara)
  loop do
    chute = pede_um_chute
    if chutes.include? chute #.include indica se ja exite elemento dentro de array
      avisa_chute_efetuado(chute)
    else
      return chute
    end
  end
end

def joga nome
  palavra_secreta = escolhe_palavra_secreta_sem_consumir_muita_memoria

  erros = 0
  chutes = []
  pontos_ate_agora = 0

  while erros < 5
    mascara = define_palavra_mascarada(chutes, palavra_secreta)
    chute = pede_um_chute_valido(chutes,erros,mascara)
    chutes << chute # << adiciona na lista de arrays o chute

    if chute.size == 1
      letra_procurada = chute[0]
      total_encontrado = palavra_secreta.count letra_procurada #.count ja conta quantas vezes aparece a letra
      
      if total_encontrado == 0
        avisa_letra_nao_encontrada
        erros += 1
      else
        avisa_letra_encontrada_numero_vezes(total_encontrado)
      end
    else
      if chute == palavra_secreta
        avisa_acertou_palavra
        pontos_ate_agora += 100
        break
      else
        avisa_errou_palavra
        pontos_ate_agora -= 30
        erros += 1
      end
    end
  end


  avisa_pontos(pontos_ate_agora)
  pontos_ate_agora
end

def jogo_da_forca
  nome = da_boas_vindas
  pontos_totais = 0

  avisa_campeao_atual le_rank

  loop do 
    pontos_totais += joga nome
    avisa_pontos_totais(pontos_totais)
    if le_rank[1].to_i < pontos_totais
      salva_rank(nome, pontos_totais)
    end
    if nao_quer_jogar
      break
    end
  end
end