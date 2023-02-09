#!/bin/bash

# handy collection of scripts/functions for quick calculations
# may attach an SQL db in the future

# init
# TODO: skip if flag params were provided

# vars, params, inputs...
declare -a playeableClasses=("Barbarian" "Bard" "Cleric" "Druid" "Fighter" "Monk" "Paladin" "Ranger"
  "Rogue" "Sorcerer" "Warlock" "Wizard")

i=1
for playeableClass in "${playeableClasses[@]}"; do
  echo "${i}. ${playeableClass}"
  i=$((i + 1))
done

echo ""
read -p "Choose a class: " playerClassInput
echo ""

if ! [[ $playerClassInput -ge 1 && $playerClassInput -le 12 ]]; then
  echo "Did not find class, exiting!" >&2
  exit 1
fi
# assign name to class num
case $playerClassInput in
1)
  echo "You've chosen ${playeableClasses[0]}, a true muscle head."
  ;;
2)
  echo "You've chosen ${playeableClasses[1]}, you cast spells, but only funny ones that are useless..."
  ;;
3)
  echo "You've chosen ${playeableClasses[2]}, you shall pray to your god now."
  ;;
4)
  echo "You've chosen ${playeableClasses[3]}, you feel the nature flowing in you veins."
  ;;
5)
  echo "You've chosen ${playeableClasses[4]}, you feel the urge to grab a sword and slain your foes."
  ;;
6)
  echo "You've chosen ${playeableClasses[5]}, you think about you master's wise teachings."
  ;;
7)
  echo "You've chosen ${playeableClasses[6]}, you shall do everything and anything to keep your oath!"
  ;;
8)
  echo "You've chosen ${playeableClasses[7]}, you know your way around these woods well."
  ;;
9)
  echo "You've chosen ${playeableClasses[8]}, you are an artist in both silence and death."
  ;;
10)
  echo "You've chosen ${playeableClasses[9]}, idk, you sorcer spells."
  ;;
11)
  echo "You've chosen ${playeableClasses[10]}, you cast dark spells."
  ;;
12)
  echo "You've chosen ${playeableClasses[11]}, you cast spells as well, but you're a munchkin."
  ;;
0)
  echo "You did not enter a number between 1 and 12." >&2
  exit 1
  ;;
esac
echo ""

read -p "Your level: " playerLevel
while ! [[ $playerLevel -ge 1 && $playerLevel -le 20 ]]; do
  read -p "Invalid number, try again: " playerLevel
done

# functions
rollHit() {
  local diceRoll
  read -p "Enter your roll" diceRoll
  echo "hit"
}

rollDamage() {
  echo "dmg"
}

rollInitiative() {
  echo "init"
}

rollSavingThrow() {
  echo "saving throw"
}

rollAbilityCheck() {
  echo "ability check"
}


menu() {
  # sub-menus
  rollMenu() {
    local chosenMenuOption=1
    while [ $chosenMenuOption -ne 0 ]; do
      echo "----------------------|"
      echo "1. Roll hit           |"
      echo "2. Rolls damage       |"
      echo "3. Rolls initiative   |"
      echo "4. Rolls saving throw |"
      echo "0. Back               |"
      echo "----------------------|"
      echo ""
      read -p "Select menu option: " chosenMenuOption
      case $chosenMenuOption in
      1)
        rollHit
        ;;
      2)
        rollDamage
        ;;
      3)
        rollInitiative
        ;;
      4)
        rollSavingThrow
        ;;
      5)
        rollAbilityCheck
        ;;
      0)
        break
        ;;
      *)
        echo "Invalid menu option!" >&2
        ;;
      esac
    done

  }

  # main menu
  local chosenMenuOption=1
  while [ $chosenMenuOption -ne 0 ]; do
    echo "----------------------|"
    echo "1. Rolls              |"
    echo "0. Exit               |"
    echo "-----------------------"
    read -p "Select menu option: " chosenMenuOption
    case $chosenMenuOption in
    1)
      rollMenu
      ;;
    0)
      break
      ;;
    *)
      echo "Invalid menu option!" >&2
      ;;
    esac
  done
}

# run the menu after the init is finished
menu


# end of script, exit
echo ""
echo "Exiting..."
echo ""
echo ""
exit 0
