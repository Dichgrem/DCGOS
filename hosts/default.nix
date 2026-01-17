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
      home-manager = {
        extraSpecialArgs = {inherit hostname inputs username;};
        users.${username} = import ../home;
      };
    }
  ];
}
