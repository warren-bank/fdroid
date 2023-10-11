### [self-hosted F-Droid _simple binary repo_](https://github.com/warren-bank/fdroid/tree/gh-pages)

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

* the official [F-Droid client](https://gitlab.com/fdroid/fdroidclient)
  - __can NOT__ be used with this F-Droid app repo
    * tested with versions:
      - [`1.17.0`](https://f-droid.org/repo/org.fdroid.fdroid_1017050.apk)
        * APK size: 10 MB
        * minSDK: [API 23](https://github.com/f-droid/fdroidclient/blob/1.17.0/app/build.gradle#L35) (Android 6.0, Marshmallow)
      - [`1.15.6`](https://f-droid.org/archive/org.fdroid.fdroid_1015056.apk)
        * APK size: 8.5 MB
        * minSDK: [API 22](https://github.com/f-droid/fdroidclient/blob/1.15.6/app/build.gradle#L31) (Android 5.1, Lollipop)
      - [`1.12.1`](https://f-droid.org/archive/org.fdroid.fdroid_1012051.apk)
        * APK size: 8.2 MB
        * minSDK: [API 14](https://github.com/f-droid/fdroidclient/blob/1.12.1/app/build.gradle#L31) (Android 4.0, Ice Cream Sandwich)
  - does __NOT__ follow HTTP 3xx redirects
    * this is [claimed by its developers to be by design](https://gitlab.com/fdroid/fdroidclient/-/merge_requests/683)
* my [unofficial fork](https://github.com/warren-bank/fork-Android-fdroidclient/tree/fork/1.12.1/main) of the official F-Droid client
  - __can__ be used with this F-Droid app repo
    * tested with version:
      - [`fork/1.12.1/v1.0.0`](https://github.com/warren-bank/fork-Android-fdroidclient/releases/tag/fork%2F1.12.1%2Fv1.0.0)
        * APK size: 8.35 MB
        * minSDK: [API 14](https://github.com/warren-bank/fork-Android-fdroidclient/blob/fork/1.12.1/v1.0.0/app/build.gradle#L33) (Android 4.0, Ice Cream Sandwich)
  - forks from the tag: [`1.12.1`](https://gitlab.com/fdroid/fdroidclient/-/tags/1.12.1)
  - changes:
    * follow HTTP 3xx redirects
    * trust user-added CAs
* [_Foxy Droid_](https://github.com/kitsunyan/foxy-droid)
  - __can__ be used with this F-Droid app repo
    * tested with version:
      - [`1.3`](https://github.com/kitsunyan/foxy-droid/releases/tag/1.3)
        * APK size: 1.0 MB
        * minSDK: [API 21](https://github.com/kitsunyan/foxy-droid/blob/1.3/build.gradle#L28) (Android 5.0, Lollipop)
  - this client is my personal favorite
    * minimal UI, without any clutter
    * works great
* [_Droid-ify_](https://github.com/NeoApplications/Neo-Store)
  - __can__ be used with this F-Droid app repo
    * tested with version:
      - [`0.4.3`](https://github.com/NeoApplications/Neo-Store/releases/tag/v0.4.3)
        * APK size: 3.46 MB
        * minSDK: [API 21](https://github.com/NeoApplications/Neo-Store/blob/v0.4.3/build.gradle#L23) (Android 5.0, Lollipop)
* [_Neo Store_](https://github.com/NeoApplications/Neo-Store)
  - __can__ be used with this F-Droid app repo
    * tested with version:
      - [`0.9.15`](https://github.com/NeoApplications/Neo-Store/releases/tag/0.9.15)
        * APK size: 5.1 MB
        * minSDK: [API 23](https://github.com/NeoApplications/Neo-Store/blob/0.9.15/build.gradle.kts#L26) (Android 6.0, Marshmallow)
