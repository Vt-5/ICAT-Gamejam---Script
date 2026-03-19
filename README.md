# Turma A1 (Godot)

Projeto de jogo em Godot focado na estrutura base: cenas, scripts e organização inicial de assets. O objetivo atual é estabelecer o esqueleto do projeto para evoluir gameplay, mapas e personagens.

**Stack**
- Godot Engine `4.6` (feature flag no `project.godot`)
- GDScript
- 2D (uso de `CharacterBody2D`, `TileMapLayer`, `Area2D`)
- Renderer: `GL Compatibility`
- Física 3D: `Jolt Physics` (configurado no projeto)

**Estrutura do Projeto**
```
.
├─ Artes/                # Assets organizados por categoria
│  ├─ Itens/
│  ├─ Personagens/
│  └─ TileSet/
├─ Cenas/                # Scenes (.tscn)
│  ├─ Itens/
│  ├─ Mapas/
│  └─ Personagens/
├─ Scripts/              # Scripts GDScript (.gd)
│  ├─ Aux/
│  ├─ Itens/
│  ├─ Mapas/
│  └─ Personagens/
├─ project.godot         # Configuração do projeto
├─ icon.svg              # Ícone do projeto
└─ icon.svg.import       # Metadados de importação do Godot
```

**Cenas Principais**
- `Cenas/cena_principal.tscn`: cena base do jogo (ligada a `Scripts/cena_principal.gd`).
- `Cenas/Personagens/player.tscn`: personagem controlável.
- `Cenas/Mapas/mapa_1.tscn`: mapa inicial.
- `Cenas/Itens/item_coletavel.tscn`: item coletável base.

**Scripts Principais**
- `Scripts/cena_principal.gd`: nó raiz da cena principal.
- `Scripts/Personagens/player.gd`: lógica de movimento, pulo e animações do jogador.
- `Scripts/Mapas/mapa_1.gd`: base do mapa.
- `Scripts/Itens/item_coletavel.gd`: base de item coletável (com sinal de colisão).
- `Scripts/Aux/Global.gd`: autoload configurado em `project.godot` como `Global`.

**Como Abrir**
1. Abra o Godot 4.6.
2. Importe a pasta do projeto.
3. Execute a `Cenas/cena_principal.tscn`.

Se quiser, posso detalhar o fluxo de gameplay atual, documentar inputs e adicionar um guia de contribuição.
