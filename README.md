# Linux Update & Install Script

![Linux Logo](https://upload.wikimedia.org/wikipedia/commons/a/af/Tux.png)

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

## Licence

Tento projekt je licencován pod [MIT licencí](LICENSE).

## Autor

Operace byly provedeny s využitím skriptu vytvořeného [Mates](https://forum.linuxdoma.cz/u/mates/activity). Další informace a projekty naleznete na:

- Fórum: [https://forum.linuxdoma.cz/u/mates/activity](https://forum.linuxdoma.cz/u/mates/activity)
- Wiki: [https://wiki.matejserver.cz](https://wiki.matejserver.cz)
- GitHub: [https://github.com/mkeyCZ/](https://github.com/mkeyCZ/)

---

![GitHub](https://upload.wikimedia.org/wikipedia/commons/9/91/Octicons-mark-github.svg) **Pro více informací navštivte můj GitHub profil.**
```

### Popis jednotlivých částí:

1. **Nadpis a grafika:**
   - Přidán nadpis projektu a logo Linuxu, které dává čtenáři vizuální náznak, že jde o projekt zaměřený na Linux.
  
2. **Popis projektu:**
   - Jasný a stručný popis, který vysvětluje, co skript dělá a komu je určen.
  
3. **Seznam aplikací:**
   - Seznam aplikací, které skript může instalovat, rozdělený na balíčky instalované přes `pacman` a `paru`.
  
4. **Instalace a použití:**
   - Návod na klonování repozitáře, instalaci a použití skriptu.
  
5. **Contributing:**
   - Výzva k přispění a hlášení chyb prostřednictvím pull requestů a issues.

6. **Licence:**
   - Informace o licenci projektu.

7. **Autor:**
   - Informace o autorovi, včetně odkazů na vaše aktivity na internetu, doplněné o odkaz na váš GitHub profil.

### Grafika:
- Použití obrázků (logo Linuxu a GitHubu) a emoji pomáhá textu vyniknout a činí ho přitažlivějším.

Tento `README.md` soubor poskytne návštěvníkům vašeho GitHub repozitáře jasnou představu o tom, co skript dělá, a jak jej použít, a také je navede na další vaše projekty a aktivity.
