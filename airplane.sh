#!/data/data/com.termux/files/usr/bin/bash

# Verifica se o script está sendo executado com root
if [ "$(id -u)" -ne 0 ]; then
  echo "Este script requer permissões de root (su)."
  exit 1
fi

# Pergunta ao usuário o intervalo entre ciclos
read -p "Informe o tempo em segundos entre cada troca (excluindo os 2s do modo avião ativo): " INTERVALO

echo "Iniciando o ciclo de ativação/desativação do modo avião a cada $INTERVALO segundos..."

while true; do
  echo "Ativando modo avião..."
  settings put global airplane_mode_on 1
  am broadcast -a android.intent.action.AIRPLANE_MODE --ez state true

  sleep 2

  echo "Desativando modo avião..."
  settings put global airplane_mode_on 0
  am broadcast -a android.intent.action.AIRPLANE_MODE --ez state false

  echo "Aguardando $INTERVALO segundos..."
  sleep "$INTERVALO"
done
