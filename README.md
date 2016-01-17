# Google Authenticator Overlay

An overlay for Gentoo, specifically for the Google Authenticator 2-factor authentication.
The ebuild is from the gentoo bug report: https://bugs.gentoo.org/show_bug.cgi?id=419177

##Install

[Local overlays](https://wiki.gentoo.org/wiki/Overlay/Local_overlay) should be managed via `/etc/portage/repos.conf/`.
To enable this overlay make sure you are using a recent Portage version (at least `2.2.14`), and create an `/etc/portage/repos.conf/google-authenticator-overlay.conf` file containing precisely:

```
[google-authenticator-overlay]
location = /usr/local/portage/google-authenticator-overlay
sync-type = git
sync-uri = https://github.com/stefan-langenmaier/google-authenticator-overlay.git
priority=9999
```

Afterwards, simply run `emerge --sync`, and Portage should seamlessly make all our ebuilds available.

Or with a modern version of [layman](https://wiki.gentoo.org/wiki/Layman) (>=2.3.0) you can just run the following line and the repo and its configuration will be setup automatically.

```
layman -o https://raw.github.com/stefan-langenmaier/syncthing-overlay/master/repositories.xml -f -a syncthing-overlay
```

The packages might need manual unmasking in `/etc/portage/package.accept_keywords` before they can be emerged. 

---
