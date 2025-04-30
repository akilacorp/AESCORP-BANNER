<h1 align="center">🚀 AESCORP-BANNER</h1>
<p align="center">
  Ferramenta de personalização extrema para <strong>Termux</strong>, com banners, temas zsh, spinner de instalação, animações e estilo hacker 🔥.
</p>

---

## 📌 Sobre

O **AESCORP-BANNER** é um script avançado que transforma completamente a aparência do seu Termux. Ele instala pacotes essenciais, configura zsh com tema personalizado, aplica fontes e cores únicas, além de adicionar banners com o seu nome.

Ideal para quem quer deixar o Termux com **estilo hacker**, otimizando usabilidade com plugins visuais e comandos rápidos.

---

## 🧰 Funcionalidades

- 🎯 Spinner animado durante instalação
- 🖌️ Nome personalizado no banner inicial
- 🎨 Tema ZSH exclusivo da AESCORP
- 💎 Fontes e cores personalizadas
- 🧠 Autodetecção de conexão e dependências
- 📦 Instalação automática de pacotes essenciais:
  `git`, `python`, `figlet`, `zsh`, `curl`, `jq`, `lsd`, `exa`, `ruby`, `termux-api` e mais
- 🧩 Integração com Oh-My-Zsh + plugins:
  - `zsh-autosuggestions`
  - `zsh-syntax-highlighting`

---

## ⚙️ Pré-requisitos

- Android com Termux instalado (última versão)
- Permissões de armazenamento ativadas
- Conexão com a internet

---

## 📥 Instalação

```bash
pkg update && pkg upgrade
pkg install git -y
git clone https://github.com/pudimv2v2/AESCORP-BANNER
cd AESCORP-BANNER
bash install.sh
