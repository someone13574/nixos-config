{ config, ... }: {
  home.file."${config.xdg.configHome}/solaar/config.yaml".text = ''
    - 1.1.13
    - _NAME: MX Master 3 Wireless Mouse
      _absent: [hi-res-scroll, lowres-scroll-mode, onboard_profiles, report_rate, report_rate_extended, pointer_speed, dpi_extended, speed-change, backlight,
        backlight_level, backlight_duration_hands_out, backlight_duration_hands_in, backlight_duration_powered, backlight-timed, led_control, led_zone_, rgb_control,
        rgb_zone_, brightness_control, per-key-lighting, fn-swap, persistent-remappable-keys, disable-keyboard-keys, crown-smooth, divert-crown, divert-gkeys,
        m-key-leds, mr-key-led, multiplatform, gesture2-gestures, gesture2-divert, gesture2-params, sidetone, equalizer, adc_power_management]
      _battery: 4096
      _modelId: B02340820000
      _sensitive: {divert-keys: false, hires-smooth-resolution: false, reprogrammable-keys: false, scroll-ratchet: false, smart-shift: false}
      _serial: 699F12B8
      _unitId: 699F12B8
      _wpid: '4082'
      change-host: null
      divert-keys: {82: 0, 83: 2, 86: 2, 195: 2, 196: 2}
      dpi: 1000
      hires-scroll-mode: false
      hires-smooth-invert: false
      hires-smooth-resolution: true
      reprogrammable-keys: {80: 80, 81: 81, 82: 82, 83: 83, 86: 86, 195: 195, 196: 196}
      scroll-ratchet: 2
      smart-shift: 10
      thumb-scroll-invert: false
      thumb-scroll-mode: false
  '';

  home.file."${config.xdg.configHome}/solaar/rules.yaml".text = ''
    %YAML 1.3
    ---
    - Rule:
      - MouseGesture: [Forward Button, Mouse Left]
      - KeyPress:
        - [Control_L, Alt_L, Left]
        - click
    - Rule:
      - MouseGesture: [Forward Button, Mouse Right]
      - KeyPress:
        - [Control_L, Alt_L, Right]
        - click
    - Rule:
      - MouseGesture: [Forward Button, Mouse Up]
      - KeyPress:
        - [Super_L, s]
        - click
    - Rule:
      - MouseGesture: Mouse Gesture Button
      - KeyPress:
        - [Alt_L, F2]
        - click
    - Rule:
      - MouseGesture: [Back Button, Mouse Left]
      - KeyPress:
        - [Alt_L, Left]
        - click
    - Rule:
      - MouseGesture: [Back Button, Mouse Right]
      - KeyPress:
        - [Alt_L, Right]
        - click
    - Rule:
      - MouseGesture: Smart Shift
      - And:
        - Setting:
          - null
          - scroll-ratchet
          - 1
        - Set:
          - null
          - scroll-ratchet
          - 2
    - Rule:
      - MouseGesture: Smart Shift
      - And:
        - Setting:
          - null
          - scroll-ratchet
          - 2
        - Set:
          - null
          - scroll-ratchet
          - 1
    - Rule:
      - MouseGesture: [Smart Shift, Mouse Up]
      - KeyPress:
        - [Super_L, Up]
        - click
    - Rule:
      - MouseGesture: [Smart Shift, Mouse Left]
      - KeyPress:
        - [Super_L, Left]
        - click
    - Rule:
      - MouseGesture: [Smart Shift, Mouse Right]
      - KeyPress:
        - [Super_L, Right]
        - click
    - Rule:
      - MouseGesture: [Smart Shift, Mouse Down]
      - KeyPress:
        - [Super_L, Down]
        - click
    ...
  '';
}
