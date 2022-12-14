#Please see the loader file for information on the license and author info.
module ASM_Extensions
  module RandomPick
    require FILE_DATA
  end # module RandomPick

  if !file_loaded?('asm_menu_loader')
    @@asm_tools_menu = UI.menu("Extensions").add_submenu("ASM Tools")
  end

  if !file_loaded?(__FILE__)
    @@asm_tools_menu.add_item(RandomPick::PLUGIN_NAME) { RandomPick.apply_random_pick }
  end

  file_loaded('asm_menu_loader')
  file_loaded(__FILE__)
end # module ASM_Extensions
