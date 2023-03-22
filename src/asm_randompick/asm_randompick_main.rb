# Please see the loader file for information on the license and author info.
module ASM_Extensions
  module RandomPick
    require FILE_DATA
  end # module RandomPick

  if !defined?(@asm_tools_menu_loaded)
    @asm_tools_menu = UI.menu("Extensions").add_submenu("ASM Tools")
    @asm_tools_menu_loaded = true
  end

  if !defined?(@randompick_loaded)
    @asm_tools_menu.add_item(RandomPick::PLUGIN_NAME) { RandomPick.apply_randompick }
    @randompick_loaded = true
  end # module RandomPick
end # module ASM_Extensions
