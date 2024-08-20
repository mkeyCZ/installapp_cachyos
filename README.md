# Linux Update & Install Script

![Linux Doma Logo](https://forum.linuxdoma.sk/uploads/default/original/1X/31a5d004a75873ce6dfdd07333ce730b6cc7f013.png)

## Popis

Tento skript je určen pro uživatele Arch Linuxu a jeho derivátů. Automatizuje proces aktualizace systému pomocí `pacman` a `paru`, a zároveň umožňuje snadnou instalaci vybraných aplikací. Skript nabízí možnost nainstalovat všechny aplikace najednou, nebo si můžete interaktivně zvolit, které balíčky chcete nainstalovat.

## Funkce

- **Aktualizace systému** pomocí `pacman` a `paru`
- **Instalace všech balíčků** najednou
- **Interaktivní výběr balíčků** pro instalaci
- **Podpora AUR balíčků** přes `paru`
- **Bezpečná správa balíčků**: AUR balíčky se instalují jako běžný uživatel, nikoliv jako root

## Seznam aplikací

### Pacman balíčky

- Kodi
- VLC
- Audacity
- EasyTAG
- HandBrake
- Kdenlive
- OBS Studio
- OnlyOffice
- GIMP
- Krita

### Paru balíčky

- Tiny Media Manager
- JDownloader2
- Brave Browser
- Insync
- TTF MS Fonts

## Instalace a použití

### 1. Klonování repozitáře

Klonujte tento repozitář do vašeho místního systému:

```bash
git clone https://github.com/mkeyCZ/linux-update-install-script.git
cd linux-update-install-script
```

### 2. Spuštění skriptu

Nejprve se ujistěte, že máte nainstalován `paru`. Pokud není nainstalován, nainstalujte ho podle návodu na [paru GitHubu](https://github.com/Morganamilo/paru).

Poté spusťte skript podle vašich potřeb:

- **Aktualizace systému:**

  ```bash
  sudo ./update-install.sh --update
  ```

- **Instalace všech balíčků:**

  ```bash
  sudo ./update-install.sh --install-all
  ```

- **Interaktivní výběr balíčků:**

  ```bash
  sudo ./update-install.sh --install
  ```

### 3. Poznámky

- Skript vyžaduje spuštění s právy superuživatele (`sudo`) pro operace s `pacman`.
- `paru` se používá k instalaci AUR balíčků a tyto operace se provádějí jako běžný uživatel.

## Contributing

Pokud máte návrhy na vylepšení nebo najdete chyby, neváhejte vytvořit pull request nebo otevřít issue.

## Autor

Operace byly provedeny s využitím skriptu vytvořeného [Mates](https://forum.linuxdoma.cz/u/mates/activity). Další informace a projekty naleznete na:

- Fórum: [Linuxdoma](https://forum.linuxdoma.cz/u/mates/activity)
- Wiki: [Wiki](https://wiki.matejserver.cz)
- GitHub: [Github](https://github.com/mkeyCZ/)
