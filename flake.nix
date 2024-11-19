{
  description = "NixOS configuration of Aqeel Akber <aqeel@aqeelakber.com>";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
    	url = "github:nix-community/home-manager/release-24.05";
	    inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: {
    nixosConfigurations = {
    discipline = let
      username = "brat";
      hostName = "discipline";
      userFullName = "Aqeel Akber";
      userEmail = "aqeel@aqeelakber.com";
      specialArgs = {inherit username hostName userFullName userEmail;};
    in
      nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";

        modules = [
          ./hosts/${hostName}
          ./users/${username}/nixos.nix

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            home-manager.extraSpecialArgs = inputs // specialArgs;
            home-manager.users.${username} = import ./users/${username}/home.nix;
          }

        ];
      };
    };
  };
}
