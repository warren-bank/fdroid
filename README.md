### [self-hosted F-Droid _simple binary repositories_:](https://github.com/warren-bank/fdroid/tree/gh-pages)

| name:   | URL:                                                                                                                                                                      | QR code:                                                                                             |
|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| repo    | [https://warren-bank.github.io/fdroid/repo](https://warren-bank.github.io/fdroid/repo?fingerprint=E991BE73E9C4A5302B844DBF90151D9E599FBA212ACCD1A970802A74C9903078)       | ![repo-QR-code](https://github.com/warren-bank/fdroid/raw/apache-htdocs/htdocs/repo/index.png)       |
| archive | [https://warren-bank.github.io/fdroid/archive](https://warren-bank.github.io/fdroid/archive?fingerprint=E991BE73E9C4A5302B844DBF90151D9E599FBA212ACCD1A970802A74C9903078) | ![archive-QR-code](https://github.com/warren-bank/fdroid/raw/apache-htdocs/htdocs/archive/index.png) |

#### Overview

* the [F-Droid docs](https://f-droid.org/docs/) go into great detail&hellip;
* an excerpt from the page on how to: [Setup an F-Droid App Repo](https://f-droid.org/docs/Setup_an_F-Droid_App_Repo/)
  > F-Droid.org is the default package repository (repo) in the F-Droid client, but it is not the only possibility.<br>
  > Anyone can create their own repo, and users can control which repos their client is using,<br>
  > including even disabling the default f-droid.org repo.<br>
  > This model is modeled somewhat after the [Debian GNU/Linux](https://www.debian.org/) distro.<br>
  > Like Debian and Ubuntu, you can also setup your own repos for anyone to use.<br>
  > Custom repos do not even need to build the APKs, they can just be “simple binary repos” of any APKs.

#### Static File Hosting

* [_Github Pages_](https://docs.github.com/pages) publishes this _gh-pages_ branch
  - pro:
    * it provides free static file hosting
  - con:
    * it doesn't provide the ability to specify server-side 301 redirects
      - which is a requirement for me in choosing a host for my F-Droid app repo&hellip;
      - I'd like to redirect all APK file requests to the corresponding file<br>
        within the _releases_ section of the respective app's github repo
      - the alternative is to upload and mirror all binary files,<br>
        which I'm too lazy to maintain
  - workaround:
    * adding a [_CNAME_ configuration file](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-a-subdomain) to this _gh-pages_ branch&hellip;
      - allows me to easily redirect:
        * from the canonical URL:<br>&nbsp;&nbsp;[_https://warren-bank.github.io/fdroid/_](https://warren-bank.github.io/fdroid/)
        * to a free webhost&hellip;
          - that:
            * runs Apache
            * includes the _mod_rewrite_ module
            * supports _.htaccess_ with redirect rules
          - currently:
            * my free webhost is:<br>&nbsp;&nbsp;[_freewebhostingarea.com_](https://www.freewebhostingarea.com/)
            * my free subdomain is:<br>&nbsp;&nbsp;`warren-bank.orgfree.com`
      - example:
        * request:<br>&nbsp;&nbsp;GET [https://warren-bank.github.io/fdroid/repo/test.apk](https://warren-bank.github.io/fdroid/repo/test.apk)
        * response:<br>&nbsp;&nbsp;301 Location: [http://warren-bank.orgfree.com/repo/test.apk](http://warren-bank.orgfree.com/repo/test.apk)
    * example _.htaccess_ file:
      ```text
        <IfModule mod_rewrite.c>
        RewriteEngine On
        </IfModule>

        Redirect 301 /repo/test.apk https://github.com/warren-bank/Android-ExoPlayer-AirPlay-Receiver/releases/download/v3.4.5/ExoPlayer-AirPlay-Receiver-003.04.05-16API-withAllLanguageTranslations-noDecoderExtensions-release.apk
      ```

#### F-Droid Clients

__released by original developers__:

* [_Foxy Droid_](https://github.com/kitsunyan/foxy-droid)
  - tested with versions:
    * [`1.3`](https://github.com/kitsunyan/foxy-droid/releases/tag/1.3)
      - APK size: 1.0 MB
      - minSDK: [API 21](https://github.com/kitsunyan/foxy-droid/blob/1.3/build.gradle#L28) (Android 5.0, Lollipop)
  - limitations:
    * only supports English
      - app UI
      - repo locale
  - comments:
    * this client is my personal favorite
      - minimal UI, without any clutter
      - works great

* [_Droid-ify_](https://github.com/Droid-ify/client)
  - tested with versions:
    * [`0.5.7`](https://github.com/Droid-ify/client/releases/tag/v0.5.7)
      - APK size: 3.51 MB
      - minSDK: [API 23](https://github.com/Droid-ify/client/blob/v0.5.7/buildSrc/src/main/kotlin/Android.kt#L4) (Android 6.0, Marshmallow)
    * [`0.4.3`](https://github.com/NeoApplications/Neo-Store/releases/tag/v0.4.3)
      - APK size: 3.46 MB
      - minSDK: [API 21](https://github.com/NeoApplications/Neo-Store/blob/v0.4.3/build.gradle#L23) (Android 5.0, Lollipop)
  - _IMPORTANT_:
    * version `0.5.7` is the last version that allows HTTP redirects
    * the [developer says](https://github.com/Droid-ify/client/issues/572):
      > Redirects are not supported because it makes the app more vulnerable to phishing attacks and other MitM like attacks.

* [_Neo Store_](https://github.com/NeoApplications/Neo-Store)
  - tested with versions:
    * [`0.9.15`](https://github.com/NeoApplications/Neo-Store/releases/tag/0.9.15)
      - APK size: 5.1 MB
      - minSDK: [API 23](https://github.com/NeoApplications/Neo-Store/blob/0.9.15/build.gradle.kts#L26) (Android 6.0, Marshmallow)

__released by me from forks that allow HTTP redirects__:

* [F-Droid client](https://github.com/warren-bank/fork-Android-fdroidclient)
  - tested with versions:
    * [`fork/1.18.0/v1.0.0`](https://github.com/warren-bank/fork-Android-fdroidclient/releases/tag/fork%2F1.18.0%2Fv1.0.0)
      - APK size: 11.7 MB
      - minSDK: [API 23](https://github.com/warren-bank/fork-Android-fdroidclient/blob/fork/1.18.0/v1.0.0/app/build.gradle#L37) (Android 6.0, Marshmallow)
      - forked from tag: [`1.18.0`](https://gitlab.com/fdroid/fdroidclient/-/tags/1.18.0)
      - changes:
        * follow HTTP 3xx redirects
        * [Android 7.0+] trust user-added CAs
    * [`fork/1.2.2/v1.0.0`](https://github.com/warren-bank/fork-Android-fdroidclient/releases/tag/fork%2F1.2.2%2Fv1.0.0)
      - APK size: 7.0 MB
      - minSDK: [API 10](https://github.com/warren-bank/fork-Android-fdroidclient/blob/fork/1.2.2/v1.0.0/app/build.gradle#L144) (Android 2.3.3, Gingerbread)
      - forked from tag: [`1.2.2`](https://gitlab.com/fdroid/fdroidclient/-/tags/1.2.2)
      - changes:
        * follow HTTP 3xx redirects
        * [Android 4.1.x - 4.4.x] enable TLS 1.1 and TLS 1.2
        * [Android 7.0+] trust user-added CAs
  - _IMPORTANT_:
    * the [developer says](https://gitlab.com/fdroid/fdroidclient/-/merge_requests/683):
      > We deliberately do not support redirects. `fdroidclient` is not a browser, it does not implement the HTTP spec, that is far too complicated. These kinds of complications just make things much harder to run securely, and make the code a lot more complicated. Think of F-Droid's network traffic as its own custom protocol.

* [_Droid-ify_](https://github.com/warren-bank/fork-Android-Droidify)
  - tested with versions:
    * [`fork/0.5.9.5/v1.0.0`](https://github.com/warren-bank/fork-Android-Droidify/releases/tag/fork%2F0.5.9.5%2Fv1.0.0)
      - APK size: 4.13 MB
      - minSDK: [API 23](https://github.com/warren-bank/fork-Android-Droidify/blob/fork/0.5.9.5/v1.0.0/build-logic/structure/src/main/kotlin/DefaultConfig.kt#L6) (Android 6.0, Marshmallow)
      - forked from tag: [`v0.5.9.5`](https://github.com/Droid-ify/client/releases/tag/v0.5.9.5)
      - changes:
        * follow HTTP 3xx redirects
  - _IMPORTANT_:
    * the [developer says](https://github.com/Droid-ify/client/issues/572):
      > Redirects are not supported because it makes the app more vulnerable to phishing attacks and other MitM like attacks.

#### Build Tools

* [my fork of _fdroidserver_](https://github.com/warren-bank/fork-fdroidserver/tree/winpython_3.7.1.0)
  - with a few modifications to run on Windows
* [my scripts to install _fdroidserver_ on Windows](https://github.com/warren-bank/fdroidserver-for-windows/tree/winpython_3.7.1.0)
  - with a ready-to-use [_virtualenv_](https://github.com/warren-bank/fdroidserver-for-windows/releases)
* [my _Node.js_ utility for _i18n_ translation and HTML-entity encoding of F-Droid metadata locales](https://github.com/warren-bank/node-translate-fdroid-metadata-text-files)
  - which is used by a build script within each F-Droid repo:
    * [repo](https://github.com/warren-bank/fdroid/blob/repo-metadata/.bin/2-translate-metadata-text-files.bat)
    * [archive](https://github.com/warren-bank/fdroid/blob/archive-metadata/.bin/2-translate-metadata-text-files.bat)
  - which produces:
    * [repo](https://github.com/warren-bank/fdroid/tree/i18n/repo-metadata/metadata)
    * [archive](https://github.com/warren-bank/fdroid/tree/i18n/archive-metadata/metadata)
  - which is bundled into each corresponding F-Droid repo index:
    * [repo](https://github.com/warren-bank/fdroid/tree/apache-htdocs/htdocs/repo)
    * [archive](https://github.com/warren-bank/fdroid/tree/apache-htdocs/htdocs/archive)
