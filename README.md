# Purpose

This is a custom [Universal Blue](https://universal-blue.org/) image for the Acer Chromebook Spin 713 (CP713-2W) Chromebook (board name: KLED).

The main purpose is to bring the Silverblue [Fedora Atomic Desktop](https://fedoraproject.org/atomic-desktops/) to this device making audio and the keyboard works out of the box.

> [!NOTE]
> It **_could_** work for others Chromebook Comet Lake devices for the audio part, the keyboard part may required some tweaking.

# How It works

- This image use [Universal Blue](https://universal-blue.org/) latest [silverblue-main](https://github.com/orgs/ublue-os/packages/container/package/silverblue-main) as base[^1]
- Add [keyd](https://github.com/rvaiya/keyd)[^2] package from [COPR](https://copr.fedorainfracloud.org/coprs/alternateved/keyd/)[^3] (keyboard)
- Add configuration from [cros-keyboard-map](https://github.com/WeirdTreeThing/cros-keyboard-map)[^4] and **cros.conf** file generated by *cros-keyboard-map.py* script (keyboard)
- Add SOF files from [chromebook-linux-audio](https://github.com/WeirdTreeThing/chromebook-linux-audio)[^4] (audio)
- Add UCM configuration files from [chromebook-ucm-conf](https://github.com/WeirdTreeThing/chromebook-ucm-conf)[^4] (audio)

# How to use

## Install an official Fedora Silverblue ISO

The ISO is available [here](https://fedoraproject.org/atomic-desktops/silverblue/download)

## Rebase to the unsigned variant of the base image

```
rpm-ostree rebase ostree-unverified-registry:ghcr.io/mikaelvz/silverblue-kled:latest
```

### Reboot

```
systemctl reboot
```

## Rebase to the signed variant of the image

```
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/mikaelvz/silverblue-kled:latest
```

### Reboot

```
systemctl reboot
```

[^1]: Maintained by [@ublue-os](https://github.com/ublue-os) team
[^2]: Maintained by [@rvaiya](https://github.com/rvaiya)
[^3]: Maintained by [@alternateved](https://github.com/alternateved)
[^4]: Maintained by [@WeirdTreeThing](https://github.com/WeirdTreeThing)
