{
  hostname,
  inputs,
  username,
  ...
}: {
  imports = with inputs; [
    ./${hostname}
    stylix.nixosModules.stylix
    home-manager.nixosModules.home-manager
    {
      environment.pathsToLink = ["/share/applications" "/share/xdg-desktop-portal"];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {inherit hostname inputs username;};
        users.${username} = import ../home;
      };
    }
  ];
}
