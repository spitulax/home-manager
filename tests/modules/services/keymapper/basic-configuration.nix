{
  services.keymapper = {
    enable = true;
    aliases = {
      "Alt" = "AltLeft";
      "AltGr" = "AltRight";
      "Super" = "Meta";
    };
    contexts = [
      {
        mappings = [
          { input = "Shift"; output = "Shift"; }
          { input = "Control"; output = "Control"; }
          { input = "Alt"; output = "Alt"; }
          { input = "ScrollLock"; output = "CapsLock"; }
          { input = "CapsLock"; output = "Escape"; }
          { input = "Alt{C}"; output = "edit_copy"; }
          { input = "Alt{V}"; output = "edit_paste"; }
        ];
      }
      { stage = true; }
      {
        class = "kitty";
        mappings = [
          { input = "edit_copy"; output = "Control{Shift{C}}"; }
          { input = "edit_paste"; output = "Control{Shift{V}}"; }
        ];
      }
    ];
    systemd.enable = true;
  };

  test.stubs.keymapper = { };

  nmt.script = ''
    config=home-files/.config/keymapper.conf
    service=home-files/.config/systemd/user/keymapper.service
    assertFileExists $config
    assertFileExists $service
    assertFileContent $config ${./keymapper.conf}
  '';
}

