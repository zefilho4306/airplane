#!/data/data/com.termux/files/usr/bin/bash

# Verifica se está com root
if [ "$(id -u)" -ne 0 ]; then
  echo "Este script requer permissões de root (su)."
  exit 1
fi

INTERVALO=50

echo "Modo avião automático iniciado. Intervalo fixo de $INTERVALO segundos..."

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
