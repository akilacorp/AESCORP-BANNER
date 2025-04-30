#bin/bash/'!¡
clear
# dx color
r='\033[1;91m'
p='\033[1;95m'
y='\033[1;93m'
g='\033[1;92m'
n='\033[1;0m'
b='\033[1;94m'
c='\033[1;96m'

X='\033[1;92m[\033[1;00m\033[1;92m]\033[1;96m'
D='\033[1;92m[\033[1;00m\033[1;92m]\033[1;93m'
E='\033[1;92m[\033[1;00m×\033[1;92m]\033[1;91m'
A='\033[1;92m[\033[1;00m+\033[1;92m]\033[1;92m'
C='\033[1;92m[\033[1;00m</>\033[1;92m]\033[92m'
lm='\033[96m▱▱▱▱▱▱▱▱▱▱▱▱\033[0m\033[96m▱▱▱▱▱▱▱▱▱▱▱▱\033[1;00m'
dm='\033[93m▱▱▱▱▱▱▱▱▱▱▱▱\033[0m\033[93m▱▱▱▱▱▱▱▱▱▱▱▱\033[1;00m'

    OS="\uf6a6"
    HOST="\uf6c3"
    KER="\uf83c"
    UPT="\uf49b"
    PKGS="\uf8d6"
    SH="\ue7a2"
    TERMINAL="\uf489"
    CHIP="\uf2db"
    CPUI="\ue266"
    HOMES="\uf015"

sp() {
    IFS=''
    sentence=$1
    second=${2:-0.05}
    for (( i=0; i<${#sentence}; i++ )); do
        char=${sentence:$i:1}
        echo -n "$char"
        sleep $second
    done
    echo
}

tr() {
if command -v curl &>/dev/null; then
    echo ""
else
    pkg install curl -y &>/dev/null 2>&1
fi
if command -v ncurses-utils -y &>/dev/null; then
    echo ""
else
    pkg install ncurses-utils -y >/dev/null 2>&1
fi
}

spin() {
echo
    local delay=0.40
    local spinner=('█■■■■' '■█■■■' '■■█■■' '■■■█■' '■■■■█')

    # Function to show the spinner while a command is running
    show_spinner() {
        local pid=$!
        while ps -p $pid > /dev/null; do
            for i in "${spinner[@]}"; do
                tput civis
                echo -ne "\033[1;96m\r [+] Installing $1 please wait \e[33m[\033[1;92m$i\033[1;93m]\033[1;0m   "
                sleep $delay
                printf "\b\b\b\b\b\b\b\b"
            done
        done
        printf "   \b\b\b\b\b"
        tput cnorm
        printf "\e[1;93m [Done $1]\e[0m\n"
        echo
        sleep 1
    }

    apt update >/dev/null 2>&1
    apt upgrade -y >/dev/null 2>&1

    # List of packages to install
    packages=("git" "python" "ncurses-utils" "jq" "figlet" "termux-api" "lsd" "zsh" "ruby" "exa")

    # Install each package with spinner
    for package in "${packages[@]}"; do
        pkg install "$package" -y >/dev/null 2>&1 &
        show_spinner "$package"
    done

pip install lolcat >/dev/null 2>&1
rm -rf data/data/com.termux/files/usr/bin/chat >/dev/null 2>&1
mv $HOME/CODEX/files/chat.sh /data/data/com.termux/files/usr/bin/chat
chmod +x /data/data/com.termux/files/usr/bin/chat
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh >/dev/null 2>&1
rm -rf /data/data/com.termux/files/usr/etc/motd
chsh -s zsh
rm -rf ~/.zshrc >/dev/null 2>&1
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions /data/data/com.termux/files/home/.oh-my-zsh/plugins/zsh-autosuggestions >/dev/null 2>&1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /data/data/com.termux/files/home/.oh-my-zsh/plugins/zsh-syntax-highlighting >/dev/null 2>&1
}
setup() {
ds="$HOME/.termux"
dx="$ds/font.ttf"
simu="$ds/colors.properties"
if [ -f "$dx" ]; then
    echo
else
	cp $HOME/CODEX/files/font.ttf "$ds"
fi

if [ -f "$simu" ]; then
    echo
else 
        
	cp $HOME/CODEX/files/colors.properties "$ds"
fi
cp $HOME/CODEX/files/ASCII-Shadow.flf $PREFIX/share/figlet/
mv $HOME/CODEX/files/remove /data/data/com.termux/files/usr/bin/
chmod +x /data/data/com.termux/files/usr/bin/remove
termux-reload-settings
}
dxnetcheck() {
clear
echo
echo -e "               ${g}╔═══════════════╗"
echo -e "               ${g}║ ${n}${c} AESCORP | ADMIN: ?ZerØPhoenix¿${g}   ║"
echo -e "               ${g}╚═══════════════╝"
echo -e "  ${g}╔════════════════════════════════════════════╗"
echo -e "  ${g}║  ${C} ${y} Verificando sua conexão com a Internet ${g}  ║"
echo -e "  ${g}╚════════════════════════════════════════════╝${n}"
while true; do
    curl --silent --head --fail https://github.com > /dev/null
    if [ "$?" != 0 ]; then
echo -e "              ${g}╔══════════════════╗"
echo -e "              ${g}║${C} ${r}Sem internet - POBRE FUDIDO ${g}║"
echo -e "              ${g}╚══════════════════╝"
        sleep 2.5
    else
        break
    fi
done
clear
}

donotchange() {
clear
    echo
    echo
    echo -e ""
    echo -e "${c}              (\_/)"
    echo -e "              (${y}^_^${c})     ${A} ${g}Olá querido${c}"
    echo -e "             ⊂(___)づ  ⋅˚₊‧ ଳ ‧₊˚ ⋅"
    echo
    echo -e " ${A} ${c}Por favor insira  ${g}Nome do banner${c}"
    echo
read -p "[+]──[Digite seu nome]────► " name
echo
    
    INPUT_FILE="$HOME/CODEX/files/.zshrc"

    sed "s/SIMU/$name/g" "$INPUT_FILE" > "$HOME/.zshrc"
    sed "s/SIMU/$name/g" "$HOME/CODEX/files/.codex.zsh-theme" > "$HOME/.oh-my-zsh/themes/codex.zsh-theme"

    if [[ $? -eq 0 ]]; then
        clear
    echo
    echo
    echo -e "		        ${g}Hey ${y}$name"
    echo -e "${c}              (\_/)"
    echo -e "              (${y}^ω^${c})     ${g}I'm Dx-Simu${c}"
    echo -e "             ⊂(___)づ  ⋅˚₊‧ ଳ ‧₊˚ ⋅"
    echo
    echo -e " ${A} ${c}Seu banner criado ${g}Com sucesso¡${c}"
    echo
    sleep 3
    else
        echo
        echo -e " ${E} ${r}Ocorreu um erro durante o processamento do arquivo."
        sleep 1
    fi
    
D1="$HOME/.termux"
VERSION="$D1/dx.txt"
    echo "version 1 1.4" > "$VERSION"
echo
clear
}

banner() {
echo
echo -e "\e[1;33m           -=[ Powered by: \e[1;36mAESCORP\e[1;33m ]=-\e[0m"
echo
}
termux() {
spin
}


if [ -d "/data/data/com.termux/files/usr/" ]; then
    tr
    dxnetcheck
    
    banner
    echo -e " ${C} ${y}Termux detectado no Android¡"
	echo -e " ${lm}"
	echo -e " ${A} ${g}Atualizando pacote..¡"
	echo -e " ${dm}"
    echo -e " ${A} ${g}Aguarde alguns minutos.${n}"
    echo -e " ${lm}"
    termux
    if [ -d "$HOME/CODEX" ]; then
        sleep 2
	clear
	banner
	echo -e " ${A} ${p}Atualização concluída...!"
	echo -e " ${dm}"
	clear
	banner
	echo -e " ${C} ${c}Configuração do pacote do seu Termux..${n}"
	echo
	echo -e " ${A} ${g}Aguarde alguns minutos.${n}"
	setup
        donotchange
	clear
        banner
        echo -e " ${C} ${c}Tipo ${g}saída ${c}então ${g}digitar ${c}Agora abra seu Termux ${g}[${n}${HOMES}${g}]${n}"
	echo
	sleep 3
	cd "$HOME"
	rm -rf CODEX
	exit 0
	    else
        clear
        banner
    echo -e " ${E} ${r}Ferramentas não saem do seu terminal."
	echo
	echo
	sleep 3
	exit
    fi
else
echo -e " ${E} ${r}Desculpe, este sistema operacional não é compatível ${p}| ${g}[${n}${HOST}${g}] ${SHELL}${n}"
echo 
echo -e " ${A} ${g}Aguarde a próxima atualização usando Linux...!"
    echo
	sleep 3
	exit
    fi
