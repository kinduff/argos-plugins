# argos-plugins

This is my personal collection of [Argos](https://github.com/p-e-w/argos/) plugins ([Bitbar](https://github.com/matryer/bitbar) for OS X, if you're into that).

| Name | Description | Configuration | Screenshot |
|-|-|-|-|
| Wakatime | Displays time spent today from the Wakatime API | If you already have Wakatime installed, this script will fetch your API key from your `$HOME/.wakatime.cfg` config file. | ![Wakatime preview](screenshots/wakatime.png) |
| Services Status | Shows status of a selection of services from statuspage.io | None, the default service selection is Github, npm, RubyGems, and Cloudinary. | ![Services Status preview](screenshots/services_status.png) |

To install, clone this repository and create a relative symbolic link to the script you would like to have. In the case of Argos:

```shell
ln -rs wakatime.5m.sh ~/.config/argos
```

And make sure the script has execute permissions.
