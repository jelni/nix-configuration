{
  hardware = {
    bluetooth.enable = true;

    cpu = {
      amd.updateMicrocode = true;
      intel.updateMicrocode = true;
    };

    enableAllFirmware = true;
  };
}
