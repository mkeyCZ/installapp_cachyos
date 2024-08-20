#!/bin/bash

# Skript pro aktualizaci systému a instalaci balíčků pomocí pacman a paru

# Funkce pro kontrolu, zda je skript spuštěn s právy superuživatele
check_root() {
  if [ "$(id -u)" -ne 0 ]; then
    echo "Tento skript musí být spuštěn s právy superuživatele (sudo) pro operace s pacmanem."
    exit 1
  fi
}

# Funkce pro aktualizaci systému pomocí pacman
update_system_pacman() {
  echo "Aktualizace systému pomocí pacman..."
  if sudo pacman -Syu --noconfirm; then
    echo "Systém byl úspěšně aktualizován pomocí pacman."
  else
    echo "Chyba při aktualizaci systému pomocí pacman." >&2
  fi
}

# Funkce pro aktualizaci balíčků nainstalovaných pomocí paru (bez root práv)
update_system_paru() {
  echo "Aktualizace balíčků nainstalovaných pomocí paru..."
  if [ "$(id -u)" -eq 0 ]; then
    sudo -u "$SUDO_USER" paru -Syu --noconfirm
  else
    paru -Syu --noconfirm
  fi

  if [ $? -eq 0 ]; then
    echo "Balíčky nainstalované pomocí paru byly úspěšně aktualizovány."
  else
    echo "Chyba při aktualizaci balíčků pomocí paru." >&2
  fi
}

# Seznam balíčků pro pacman a paru
pacman_packages=("kodi" "vlc" "audacity" "easytag" "handbrake" "kdenlive" "obs-studio" "onlyoffice-bin" "gimp" "krita")
paru_packages=("tiny-media-manager" "jdownloader2" "brave-bin" "insync" "ttf-ms-fonts")

# Funkce pro instalaci všech balíčků pomocí pacman
install_all_pacman_packages() {
  echo "Instalace všech balíčků pomocí pacman..."
  if sudo pacman -S --needed --noconfirm "${pacman_packages[@]}"; then
    echo "Všechny balíčky byly úspěšně nainstalovány pomocí pacman."
  else
    echo "Chyba při instalaci balíčků pomocí pacman." >&2
  fi
}

# Funkce pro instalaci všech balíčků pomocí paru
install_all_paru_packages() {
  echo "Instalace všech balíčků pomocí paru..."
  if [ "$(id -u)" -eq 0 ]; then
    sudo -u "$SUDO_USER" paru -S --needed --noconfirm "${paru_packages[@]}"
  else
    paru -S --needed --noconfirm "${paru_packages[@]}"
  fi

  if [ $? -eq 0 ]; then
    echo "Všechny balíčky byly úspěšně nainstalovány pomocí paru."
  else
    echo "Chyba při instalaci balíčků pomocí paru." >&2
  fi
}

# Interaktivní výběr balíčků k instalaci pomocí pacman
select_pacman_packages() {
  echo "Vyberte balíčky, které chcete nainstalovat pomocí pacman:"
  selected_packages=()

  for package in "${pacman_packages[@]}"; do
    read -p "Chcete nainstalovat $package? (y/n) " yn
    case $yn in
      [Yy]*) selected_packages+=("$package");;
      [Nn]*) ;;
      *) echo "Neplatná volba. Přeskočeno.";;
    esac
  done

  if [ ${#selected_packages[@]} -eq 0 ]; then
    echo "Žádné balíčky k instalaci pomocí pacman nebyly vybrány."
  else
    echo "Instalace vybraných balíčků pomocí pacman..."
    if sudo pacman -S --needed --noconfirm "${selected_packages[@]}"; then
      echo "Vybrané balíčky byly úspěšně nainstalovány."
    else
      echo "Chyba při instalaci vybraných balíčků." >&2
    fi
  fi
}

# Interaktivní výběr balíčků k instalaci pomocí paru
select_paru_packages() {
  echo "Vyberte balíčky, které chcete nainstalovat pomocí paru:"
  selected_packages=()

  for package in "${paru_packages[@]}"; do
    read -p "Chcete nainstalovat $package? (y/n) " yn
    case $yn in
      [Yy]*) selected_packages+=("$package");;
      [Nn]*) ;;
      *) echo "Neplatná volba. Přeskočeno.";;
    esac
  done

  if [ ${#selected_packages[@]} -eq 0 ]; then
    echo "Žádné balíčky k instalaci pomocí paru nebyly vybrány."
  else
    echo "Instalace vybraných balíčků pomocí paru..."
    if [ "$(id -u)" -eq 0 ]; then
      sudo -u "$SUDO_USER" paru -S --needed --noconfirm "${selected_packages[@]}"
    else
      paru -S --needed --noconfirm "${selected_packages[@]}"
    fi

    if [ $? -eq 0 ]; then
      echo "Vybrané balíčky byly úspěšně nainstalovány."
    else
      echo "Chyba při instalaci vybraných balíčků." >&2
    fi
  fi
}

# Funkce pro zobrazení nápovědy
show_help() {
  echo "Použití: $0 [volba]"
  echo "  -u, --update       Aktualizovat systém pomocí pacman a paru"
  echo "  -i, --install      Nabídne interaktivní instalaci balíčků pomocí pacman a paru"
  echo "  -ia, --install-all Nainstalovat všechny balíčky pomocí pacman a paru"
  echo "  -h, --help         Zobrazit tuto nápovědu"
}

# Kontrola, zda je paru nainstalován
if ! command -v paru &> /dev/null; then
  echo "paru není nainstalován. Prosím nainstalujte paru a spusťte skript znovu."
  exit 1
fi

# Zpracování argumentů příkazové řádky
case "$1" in
  -u|--update)
    update_system_pacman
    update_system_paru
    ;;
  -i|--install)
    select_pacman_packages
    select_paru_packages
    ;;
  -ia|--install-all)
    install_all_pacman_packages
    install_all_paru_packages
    ;;
  -h|--help)
    show_help
    ;;
  *)
    echo "Neplatná volba: $1"
    show_help
    exit 1
    ;;
esac

# Odkaz na autora skriptu
echo ""
echo "---------------------------------------------"
echo "  Operace dokončena! Děkuji za použití tohoto skriptu."
echo ""
echo "  Další informace a projekty najdete zde:"
echo ""
echo "  🖥️  Fórum:    https://forum.linuxdoma.cz/u/mates/activity"
echo "  📚  Wiki:     https://wiki.matejserver.cz"
echo "  💻  GitHub:   https://github.com/mkeyCZ/"
echo "---------------------------------------------"
echo ""
