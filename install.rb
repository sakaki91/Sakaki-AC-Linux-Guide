require'colorize'
require'fileutils'

def moddingGame
  loop do
    system"clear"
    puts"This script will download the Content Manager and install it in the game folder manually, press enter to continue"
    puts"Enter the game path (e.g: ~/.steam/steam/steamapps/common/assettocorsa)"
    print"> "
    moddingInput = gets.chomp.strip
    modding_fullpath = File.expand_path(moddingInput)
    Dir.chdir(modding_fullpath)
    system"wget https://acstuff.ru/app/latest.zip"
    system"unzip latest.zip"
    FileUtils.mv 'AssettoCorsa.exe', 'AssettoCorsaBackup.exe'
    FileUtils.mv 'Content Manager.exe', 'AssettoCorsa.exe'
    system"cd content/fonts/ && wget https://acstuff.club/u/blob/ac-fonts.zip && unzip ac-fonts.zip"
    break
  end
end

def mainMenu
  loop do
    system"clear"
    puts"Sakaki AC Linux Guide [English]".blue
    puts()
    puts"[install] = Assetto Corsa Dependencies"
    puts"[modding] = Content Manager"
    puts()
    print"> "
    mainMenuInput = gets.chomp.strip
    case mainMenuInput
    when "install"
      startPoint
    when "modding"
      moddingGame
      system"clear"
      print"Content Manager Installed"
      puts" [Successfully!]".green
      print"Verdana TTF Fonts Installed"
      puts" [Successfully!]".green
      break
    end
  end
end

def runGameCrash
  system"clear"
  puts"Open Steam, select Proton version 5.0-10 for the game and click Play, and wait until the game crashes silently to be able to proceed here! It may take up to 10 minutes for the game to open and crash."
  print'After the game crashes on its own, press "Enter"'.yellow
  gets
end

def installOnly
  system"clear"
  loop do
    puts"Select your prefix path: (e.g: ~/.steam/steam/steamapps/compatdata/244210/pfx)"
    print"> "
    installSelectPrefix = gets.chomp.strip
    install_path = File.expand_path(installSelectPrefix)
    Dir.chdir(install_path)
    print"#{Dir.pwd}"
    system({ 'WINEPREFIX' => install_path }, "winetricks dotnet48")
    system({ 'WINEPREFIX' => install_path }, "winetricks d3dcompiler_47")
    system({ 'WINEPREFIX' => install_path }, "winetricks vcrun2015")
    system({ 'WINEPREFIX' => install_path }, "winetricks dxvk")
    system"clear"
    print"Press Enter to continue, then winecfg will automatically open in the chosen prefix, select the Windows 10 system version, and add dwrite.dll in the libraries tab!"
    gets
    system({ 'WINEPREFIX' => install_path }, "winecfg")
    system"clear"
    print"Download wine-mono from WineHQ for the Proton version you will be using: https://dl.winehq.org/wine/wine-mono/"
    print"Then, when you press ENTER, a window will open, click the 'install' button and select the wine-mono msi installer you downloaded."
    gets
    system({ 'WINEPREFIX' => install_path }, "wine uninstall")
    system"clear"
    break
  end
end

def startPoint
  loop do
    system"clear"
    print"Do you want to delete the current prefix? "
    puts"(y/n)".blue
    print"> "
    startPointInput = gets.chomp.downcase
    case startPointInput
    when "y"
      reset
    break
    when "n"
      runGameCrash
      installOnly
    break
    end
  end
end

def reset
loop do
  FileUtils.rm_rf(File.expand_path("~/.cache/winetricks"))
  system"clear"
  puts"Select your game prefix (e.g: ~/.steam/steam/steamapps/compatdata/244210)"
  puts"The path that is placed below will be erased.".red
  print"> "
  gamePrefixDelete = gets.chomp.strip
  full_path = File.expand_path(gamePrefixDelete)
  system"clear"
  print"Do you want to continue? "
  print"(y/n)".blue
  puts" [#{gamePrefixDelete}]".green
  print"> "
  gamePrefixConfirmDelete = gets.chomp.downcase
  case gamePrefixConfirmDelete
  when "y"
      FileUtils.rm_rf(full_path)
      break
  when "n"
      system"clear"  
  end
end                                                                                                                                                                 

runGameCrash
installOnly                                                                                                                                                                         
end

mainMenu
