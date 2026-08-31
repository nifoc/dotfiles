{
  den.aspects.gallium.nixos = {
    boot.kernelParams = [
      "zfs.zfs_arc_max=134217728"
      "zfs.zfs_arc_min=33554432"
    ];
  };
}
