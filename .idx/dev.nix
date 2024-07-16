# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.ruby_3_3
    pkgs.bundler
    pkgs.gcc
    pkgs.gnumake
    pkgs.rubyPackages_3_3.ruby-lsp
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "Shopify.ruby-lsp"
      "rangav.vscode-thunder-client"
    ];
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        bundle-install = "bundle install";
      };
      # Runs when a workspace is (re)started
      onStart= {
        run-server = "bundle exec rerun 'ruby app.rb'";
      };
    };
  };
}