{
  hostname,
  inputs,
  username,
  ...
}: {
  imports = with inputs; [
    ./${hostname}
    chaotic.nixosModules.default
    disko.nixosModules.disko
    stylix.nixosModules.stylix
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        extraSpecialArgs = {inherit hostname inputs username;};
        users.${username} = import ../home;
      };
    }
  ];
}
