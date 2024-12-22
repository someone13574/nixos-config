{ ... }: {
  services.flatpak = {
    enable = true;
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
    packages = [
      "flathub:app/io.github.david_swift.Flashcards/x86_64/stable"
    ];
  };
}
