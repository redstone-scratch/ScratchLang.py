#!/bin/bash
echo
if [ h$1 == h ]; then
  echo "1. Create a project."
  echo "2. Remove a project"
  echo "3. Compile a project"
  echo "4. Decompile a .sb3 file."
  echo "5. Are options 3 and 5 not working? Input 5 to install dependencies."
  echo "6. Create alias."
  echo "7. Remove alias."
  echo "8. Disable Developer Mode."
  echo "9. Delete all variables."
  echo "A. Prepare for commit and push."
  echo "B. Exit."
  read -sn 1 input
elif [ $1 == -1 ]; then
  input=1
elif [ $1 == -2 ]; then
  input=2
elif [ $1 == -3 ]; then
  input=3
else
  input=4
fi
  if [ h$input == h1 ]; then
  dir=$(pwd)
  echo
  echo "Name your project. Keep in mind that it cannot be empty or it will not be created properly."
  read name
  if [ h$name == h ]; then
    echo "Error: Project name empty."
    exit
  fi
  echo "You named your project $name. If you want to rename it, use the File Explorer."
  cd $(dirname $(pwd))
  if ! [ -d projects ]; then
  mkdir projects
  fi
  cd projects
  mkdir $name
  cd $name
  echo >> .maindir "Please don't remove this file."
  mkdir Stage
  cd Stage
  mkdir assets
  cd $(dirname $(pwd))
  cd $(dirname $(pwd))
  cd $(dirname $(pwd))
  cp resources/cd21514d0531fdffb22204e0ec5ed84a.svg projects/$name/Stage/assets
  cd projects/$name/Stage
  echo >> $name.ss \#There should be no empty lines.
  echo >> $name.ss ss
  cd $(dirname $(pwd))
  mkdir Sprite1
  cd Sprite1
  echo >> $name.ss \#There should be no empty lines.
  echo >> $name.ss ss
  mkdir assets
  cd $(dirname $(pwd))
  cd $(dirname $(pwd))
  cd $(dirname $(pwd))
  cp resources/341ff8639e74404142c11ad52929b021.svg projects/$name/Sprite1/assets
  cp resources/c9466893cdbdda41de3ec986256e5a47.svg projects/$name/Sprite1/assets
  cd mainscripts
elif [ h$input == h2 ]; then
  cd $(dirname $(pwd))
  if ! [ -d projects ]; then
    echo "Error: there are no projects to delete."
    exit
  fi
  cd projects
  echo
  ls -1
  echo
  echo "Choose a project to get rid of, or input nothing to cancel."
  read pgrd
  if ! [ h$pgrd == h ]; then
    if [ -d $pgrd ]; then
      rm -rf $pgrd
    else
      echo "Error: directory $pgrd does not exist."
    fi
  fi
elif [ h$input == h3 ]; then
  echo "Exe or Shell?"
  read cs
  if [ h$cs == hExe ] || [ h$cs == hexe ]; then
    if ! [ -f compile.exe ]; then
      gcc -o compile.exe 2.c
    fi
    ./compile.exe
  elif [ h$cs == hShell ] || [ h$cs == hshell ]; then
    chmod 755 compiler.sh
    ./compiler.sh
  else
    echo "Error: $cs not an input."
  fi
elif [ h$input == h4 ]; then
  echo "Exe or Shell?"
  read cs
  if [ h$cs == hExe ] || [ $cs == hexe ]; then
    if ! [ -f decompiler.exe ]; then
      gcc -o decompiler.exe 3.c
    fi
    ./decompile.exe
  elif [ h$cs == hShell ] || [ h$cs == hshell ]; then
    chmod 755 decompiler.sh
    ./decompiler.sh
  else
    echo "Error: $cs not an input."
  fi
elif [ h$input == h5 ]; then
  echo "This only works for MSYS2. Continue? [Y/N]"
  read -sn 1 con
  if [ h$con == hY ] || [ h$con == hy ]; then
    pacman -S mingw-w64-x86_64-gcc
    bit=$(getconf LONG_BIT)
    dir=$(pwd)
    cd
    mkdir zenity
    cd zenity
    if [ $bit == 64 ]; then
      wget https://github.com/ncruces/zenity/releases/download/v0.9.0/zenity_win64.zip
      version=zenity_win64
    else
      wget https://github.com/ncruces/zenity/releases/download/v0.9.0/zenity_win32.zip
      version=zenity_win32
    fi
    unzip -n $version.zip
    cp zenity.exe /c/msys64/usr/bin
    cd $(dirname $(pwd))
    rm -rf zenity
    cd $dir
    ./start.sh
  elif [ h$con == hN ] || [ h$con == hn ]; then
    echo
  else
    echo "Error: $con not an input."
  fi
elif [ h$input == h6 ]; then
  dir=$(pwd)
  if ! [ -f .var/alias ]; then
    cp ~/.bashrc .var
    echo >> ~/.bashrc
    echo >> ~/.bashrc "alias scratchlang='cd $dir && ./start.sh'"
    echo >> .var/alias "This file tells the program that the alias is already created. Please don't touch this."
    echo "Please restart your terminal."
  else
    echo "alias has already been created."
  fi
elif [ h$input == h7 ]; then
  chmod 755 rmaliasiloop.sh
  ./rmaliasiloop.sh
elif [ h$input == h8 ]; then
  rm .var/devmode
  ./start.sh
elif [ h$input == h9 ]; then
  if [ -f .var/alias ]; then
    rm .var/alias
  fi
  if [ -f .var/devmode ]; then
    rm .var/devmode
  fi
  if [ -f .var/zenity ]; then
    rm .var/zenity
  fi
  if [ -f .var/.bashrc ]; then
    echo "Get rid of the ScratchLang alias? [Y/N]"
    read -sn 1 yn
    if [ h$yn == hY ] || [ h$yn == hy ]; then
      chmod 755 ./rmaliasiloop2.sh
      ./rmaliasiloop2.sh
    elif [ h$yn == hN ] || [ h$yn == hn ]; then
      if [ -f .var/.bashrc ]; then
        rm .var/.bashrc
      fi
    else
      echo "Error: $yn is not an input."
    fi
  fi
elif [ h$input == ha ] || [ h$input == hA ]; then
  if [ -f .var/alias ]; then
    rm .var/alias
  fi
  if [ -f .var/devmode ]; then
    rm .var/devmode
  fi
  if [ -f .var/zenity ]; then
    rm .var/zenity
  fi
  if [ -f compile.exe ]; then
    rm compile.exe
  fi
  if [ -f decompile.exe ]; then
    rm decompile.exe
  fi
  cd $(dirname $(pwd))
  if [ -d projects ]; then
    rm -rf projects
  fi
  cd mainscripts
  if [ -f .var/.bashrc ]; then
    echo "Get rid of the ScratchLang alias? [Y/N]"
    read -sn 1 yn
    if [ h$yn == hY ] || [ h$yn == hy ]; then
      chmod 755 ./rmaliasiloop2.sh
      ./rmaliasiloop2.sh
    elif [ h$yn == hN ] || [ h$yn == hn ]; then
      if [ -f .var/.bashrc ]; then
        rm .var/.bashrc
      fi
    else
      echo "Error: $yn is not an input."
      echo "If you want to remove the alias now, get rid of the command in the .bashrc file."
    fi
  fi
elif [ h$input == hB ] || [ h$input == hb ]; then
  clear
else
  echo "$input is not an input!"
  if [ -f .var/devmode ]; then
    ./devinputloop.sh
  else
    ./inputloop.sh
  fi
fi