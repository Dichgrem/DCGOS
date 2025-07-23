_: {
  services.ntpd-rs = {
    enable = true;
    settings = {
      source = [
        {
          address = "pool.ntp.org";
          mode = "pool";
        }
        {
          address = "time.cloudflare.com";
          mode = "server";
        }
        {
          address = "ntp.aliyun.com";
          mode = "server";
        }
      ];
    };
    useNetworkingTimeServers = false;
  };
}

