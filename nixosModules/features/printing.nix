{...}: {
  services.printing.enable = true;
  hardware.printers = {
    ensurePrinters = [
      {
        name = "Brother";
        location = "Home";
        deviceUri = "http://brother.iot.local.thefu21.net:631";
        model = "drv:///sample.drv/generic.ppd";
        ppdOptions = {
          PageSize = "A4";
        };
      }
    ];
    ensureDefaultPrinter = "Brother";
  };
}
