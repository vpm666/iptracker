#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
ORANGE='\033[0;33m'
WHITE='\033[0;97m'
BOLDWHITE='\033[1;97m'
NC='\033[0m'
BOLDRED='\033[1;31m'
BOLDCYAN='\033[1;36m'

mkdir -p ip_track

counter=1
while [[ -f "ip_track/ip_track_$counter.txt" ]]; do
    counter=$((counter + 1))
done

show_menu() {
    clear
    echo -e "${WHITE}
   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⠶⠶⠶⠶⢦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠛⠁⠀⠀⠀⠀⠀⠀⠈⠙⢷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⣠⡴⠞⠛⠉⠉⣩⣍⠉⠉⠛⠳⢦⣄⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡀⠀⣴⡿⣧⣀⠀⢀⣠⡴⠋⠙⢷⣄⡀⠀⣀⣼⢿⣦⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣧⡾⠋⣷⠈⠉⠉⠉⠉⠀⠀⠀⠀⠉⠉⠋⠉⠁⣼⠙⢷⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣇⠀⢻⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀⣸⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣹⣆⠀⢻⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡟⠀⣰⣏⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⠞⠋⠁⠙⢷⣄⠙⢷⣀⠀⠀⠀⠀⠀⠀⢀⡴⠋⢀⡾⠋⠈⠙⠻⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠋⠀⠀⠀⠀⠀⠀⠹⢦⡀⠙⠳⠶⢤⡤⠶⠞⠋⢀⡴⠟⠀⠀⠀⠀⠀⠀⠙⠻⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣼⠋⠀⠀⢀⣤⣤⣤⣤⣤⣤⣤⣿⣦⣤⣤⣤⣤⣤⣤⣴⣿⣤⣤⣤⣤⣤⣤⣤⡀⠀⠀⠙⣧⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣸⠏⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⢠⣴⠞⠛⠛⠻⢦⡄⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠸⣇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢠⡟⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⣿⣿⢶⣄⣠⡶⣦⣿⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⢻⡄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣾⠁⠀⠀⠀⠀⠘⣇⠀⠀⠀⠀⠀⠀⠀⢻⣿⠶⠟⠻⠶⢿⡿⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠈⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢰⡏⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⢾⣄⣹⣦⣀⣀⣴⢟⣠⡶⠀⠀⠀⠀⠀⠀⣼⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⣭⣭⡿⠛⠁⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠘⣧⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠀⠀⠀⣀⡴⠞⠋⠙⠳⢦⣀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⢰⡏⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⢿⣄⣀⠀⠀⢀⣤⣼⣧⣤⣤⣤⣤⣤⣿⣭⣤⣤⣤⣤⣤⣤⣭⣿⣤⣤⣤⣤⣤⣼⣿⣤⣄⠀⠀⣀⣠⡾⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⠻⢧⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠼⠟⠛⠛⠉⠁⠀⠀    "
    echo -e "${ORANGE}Created by VPM ( ${RED}RH4X${ORANGE} )${NC}"
    echo -e "\n"
    echo -e "    ${WHITE}[01] My IP"
    echo -e "    ${WHITE}[02] Track IP"
    echo -e "    ${WHITE}[00] Exit"
    echo -e "\n"
    echo -e "    ${WHITE}[~] Select an option: ${NC}"
    read -p "    Mini mod >> " option
    case $option in
        1|01) my_ip ;;
        2|02) input_ip ;;
        0|00) exit 0 ;;
        *) invalid_option ;;
    esac
}

my_ip() {
    clear
    echo -e "${WHITE}Your IP Address: $(curl -s ifconfig.me)${NC}"
    sleep 2
    show_menu
}

input_ip() {
    clear
    echo -e "${WHITE}
⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⣶⣶⣶⣤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣠⣶⣿⣿⡿⣿⣿⣿⡿⠋⠉⠀⠀⠉⠙⢿⣿⣿⡿⣿⣿⣷⣦⡀⠀⠀⠀
⠀⢀⣼⣿⣿⠟⠁⢠⣿⣿⠏⠀⠀⢠⣤⣤⡀⠀⠀⢻⣿⣿⡀⠙⢿⣿⣿⣦⠀⠀
⣰⣿⣿⡟⠁⠀⠀⢸⣿⣿⠀⠀⠀⢿⣿⣿⡟⠀⠀⠈⣿⣿⡇⠀⠀⠙⣿⣿⣷⡄
⠈⠻⣿⣿⣦⣄⠀⠸⣿⣿⣆⠀⠀⠀⠉⠉⠀⠀⠀⣸⣿⣿⠃⢀⣤⣾⣿⣿⠟⠁
⠀⠀⠈⠻⣿⣿⣿⣶⣿⣿⣿⣦⣄⠀⠀⠀⢀⣠⣾⣿⣿⣿⣾⣿⣿⡿⠋⠁⠀⠀
⠀⠀⠀⠀⠀⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⠿⠿⠿⠿⠿⠿⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀
    "
    echo -e "${ORANGE}Created by VPM ( ${RED}RH4X${ORANGE} )${NC}"
    echo -e "\n"
    echo -e "    ${WHITE}[~] Enter an IP address: ${NC}"
    read -p "    >> " ip_address
    echo -e "\n${ORANGE}IP entered: $ip_address${NC}"

    ip_info=$(curl -s "http://ip-api.com/json/$ip_address")
    city=$(echo $ip_info | jq -r '.city')
    region=$(echo $ip_info | jq -r '.regionName')
    country=$(echo $ip_info | jq -r '.country')
    latitude=$(echo $ip_info | jq -r '.lat')
    longitude=$(echo $ip_info | jq -r '.lon')
    timezone=$(echo $ip_info | jq -r '.timezone')
    postal_code=$(echo $ip_info | jq -r '.zip')
    isp=$(echo $ip_info | jq -r '.isp')
    asn=$(echo $ip_info | jq -r '.as')
    country_code=$(echo $ip_info | jq -r '.countryCode')
    currency=$(echo $ip_info | jq -r '.currency')
    languages=$(echo $ip_info | jq -r '.languages')
    calling_code=$(echo $ip_info | jq -r '.callingCode')
    google_maps="https://maps.google.com/?q=$latitude,$longitude"

    echo -e "\n${CYAN}IP Address   : ${WHITE}$ip_address"
    echo -e "${CYAN}City         : ${WHITE}$city"
    echo -e "${CYAN}Region       : ${WHITE}$region"
    echo -e "${CYAN}Country      : ${WHITE}$country"
    echo -e "${CYAN}Latitude     : ${WHITE}$latitude"
    echo -e "${CYAN}Longitude    : ${WHITE}$longitude"
    echo -e "${CYAN}Time Zone    : ${WHITE}$timezone"
    echo -e "${CYAN}Postal Code  : ${WHITE}$postal_code"
    echo -e "${CYAN}ISP          : ${WHITE}$isp"
    echo -e "${CYAN}ASN          : ${WHITE}$asn"
    echo -e "${CYAN}Country Code : ${WHITE}$country_code"
    echo -e "${CYAN}Currency     : ${WHITE}$currency"
    echo -e "${CYAN}Languages    : ${WHITE}$languages"
    echo -e "${CYAN}Calling Code : ${WHITE}$calling_code"
    echo -e "${CYAN}Google Maps  : ${WHITE}$google_maps"
    
    echo -e "\n${WHITE}[01] Track another IP"
    echo -e "[02] Copy"
    echo -e "[03] Structured Text"
    echo -e "[00] Exit"
    echo -e "\n${WHITE}[~] Select an option: ${NC}"
    read -p "    >> " choice
    case $choice in
        1|01) input_ip ;;
        2|02) copy_to_clipboard ;;
        3|03) structured_text ;;
        0|00) exit 0 ;;
        *) invalid_option ;;
    esac
}

copy_to_clipboard() {
    echo -e "${CYAN}Copied to clipboard${NC}"
    sleep 2
    show_menu
}

structured_text() {
    clear
    echo -e "${BOLDCYAN}What would you like to add?${NC}"
    echo -e "[${RED}01${CYAN}] Add Phone Number"
    echo -e "[${RED}02${CYAN}] Add Name"
    echo -e "[${RED}03${CYAN}] Generate Text"
    echo -e "[${RED}00${CYAN}] Exit"
    echo -e "\n${CYAN}[~] Select an option: ${NC}"
    read -p "    >> " option
    case $option in
        1|01) add_phone_number ;;
        2|02) add_name ;;
        3|03) generate_text ;;
        0|00) exit 0 ;;
        *) invalid_option ;;
    esac
}

add_phone_number() {
    clear
    echo -e "${WHITE}Enter the phone number:${NC}"
    read -p "> " phone
    echo -e "\n${CYAN}Phone number: *$phone*"
    sleep 2
    structured_text
}

add_name() {
    clear
    echo -e "${WHITE}Enter the name:${NC}"
    read -p "> " name
    echo -e "\n${CYAN}Name: *$name*"
    sleep 2
    structured_text
}

generate_text() {
    clear
    current_date=$(date +"%Y-%m-%d")
    current_time=$(date +"%H:%M:%S")

    # Guardar la información en un archivo .txt
    output_file="ip_track/ip_track_$counter.txt"
    echo -e "-----------------------------" > "$output_file"
    echo -e "IP Track $counter" >> "$output_file"
    echo -e "-----------------------------" >> "$output_file"
    echo -e "Date: $current_date" >> "$output_file"
    echo -e "Time: $current_time" >> "$output_file"
    echo -e "-----------------------------" >> "$output_file"
    echo -e "IP Address: $ip_address" >> "$output_file"
    echo -e "City: $city" >> "$output_file"
    echo -e "Region: $region" >> "$output_file"
    echo -e "Country: $country" >> "$output_file"
    echo -e "Latitude: $latitude" >> "$output_file"
    echo -e "Longitude: $longitude" >> "$output_file"
    echo -e "Time Zone: $timezone" >> "$output_file"
    echo -e "Postal Code: $postal_code" >> "$output_file"
    echo -e "ISP: $isp" >> "$output_file"
    echo -e "ASN: $asn" >> "$output_file"
    echo -e "Country Code: $country_code" >> "$output_file"
    echo -e "Currency: $currency" >> "$output_file"
    echo -e "Languages: $languages" >> "$output_file"
    echo -e "Calling Code: $calling_code" >> "$output_file"
    echo -e "Google Maps: $google_maps" >> "$output_file"
    if [ ! -z "$name" ]; then
        echo -e "Name: $name" >> "$output_file"
    fi
    if [ ! -z "$phone" ]; then
        echo -e "Phone Number: $phone" >> "$output_file"
    fi
    echo -e "-----------------------------" >> "$output_file"

    echo -e "${WHITE}Information saved to $output_file${NC}"
    sleep 2
    show_menu
}

invalid_option() {
    echo -e "${RED}Invalid option! Please choose a valid one.${NC}"
    sleep 2
    show_menu
}

show_menu
