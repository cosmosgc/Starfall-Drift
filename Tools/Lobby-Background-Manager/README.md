# Lobby Background Manager

Gerenciador de telas de lobby da **Estação Mega Hetero** (SS14), modelado no
`Tools/Jukebox-Manager` (mesma stack: Python + Textual).

## O que faz

- Importa `png/jpg/jpeg/webp/bmp/tga` para
  `Resources/Textures/<variant>/LobbyScreens` como `.webp` 1920x1080
  (via `ffmpeg`, com fallback para Pillow).
- Cria o sidecar `<arquivo>.yml` com `sample: filter: false`.
- Acrescenta `lobbyBackground` em `Resources/Prototypes/<variant>/lobbyscreens.yml`.
- Cria/atualiza título e artista em
  `Resources/Locale/en-US/<variant>/lobbyscreens.ftl` e
  `Resources/Locale/pt-BR/<variant>/lobbyscreens.ftl`.
- Cria entradas padrão em `Textures/.../LobbyScreens/attributions.yml`.
- Remove prototype + imagem + sidecar + locale + attributions de um só lugar.

## Uso rápido

```bat
copy .env.example .env
:: edite .env -> RESOURCE_VARIANT=_MegaHetero
python -m pip install -r requirements.txt
python app.py
```

Ou `.\app.bat`. Requer `ffmpeg` no `PATH` para a melhor conversão
(senão usa Pillow; `pip install pillow` já está no requirements).

## Atalhos

- `A` adicionar imagens | `D` remover selecionada | `C` abrir pasta de prototypes
- `U` abrir pasta de texturas | `R` atualizar | `Q` sair

Dá para arrastar arquivos para o terminal ou colar vários caminhos no diálogo.
Para adição única, o diálogo aceita título e artista; em lote usa o nome do
arquivo e artista "Unknown" (edite depois no `.ftl` / `attributions.yml`).

## Layout

```
app.py            Textual lobby background manager
requirements.txt  dependências
app.spec          config PyInstaller
assets/           (opcional) arte do README
```

## Build

```
pyinstaller --onefile --windowed app.py
```

Ou `.\build.bat`.
