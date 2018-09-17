# Android


## Tips and Tricks to make sure app is running in background for specific China ROM phones like Xiaomi, Oppo, Vivo, Lenovo, Huawei
- Auto Start permission: https://stackoverflow.com/questions/44383983/how-to-programmatically-enable-auto-start-and-floating-window-permissions-how-t / https://stackoverflow.com/questions/34149198/how-to-enable-auto-start-for-my-app-in-xiaomi-programmatically/44818978#44818978
- Handle onTaskRemoved in service class: https://stackoverflow.com/questions/47890952/on-xiaomi-or-oppo-or-vivo-phones-application-task-not-working-as-expected/48184490#48184490
- Alarm manager: https://stackoverflow.com/questions/34789311/how-to-keep-a-service-alive-using-alarmmanager-setinexactrepeating
- Check battery optimization: https://stackoverflow.com/questions/39256501/check-if-battery-optimization-is-enabled-or-not-for-an-app
- Disable Power Saving mode: https://stackoverflow.com/questions/41804070/how-to-protect-background-service-alarms-to-be-kill-in-newly-launched-devices-in
- Lock app on task manager for Xiaomi, Vivo: https://plus.google.com/109774443246850020262/posts/JHFE887Xe1u
- For Android 8 and above, you have to enable our apps to be run in the background: Launcher > Settings > Apps > App Info > tap our app > Battery > turn on the "Background activity" option
- Try foreground service. In which you will put a notification for user while your service is running: https://stackoverflow.com/questions/15758980/android-service-needs-to-run-always-never-pause-or-stop/15775964#15775964

### References
- https://medium.freecodecamp.org/why-your-push-notifications-never-see-the-light-of-day-3fa297520793
- https://fabcirablog.weebly.com/blog/creating-a-never-ending-background-service-in-android
- https://hashedin.com/blog/save-your-android-service-from-doze-mode/
- https://developer.android.com/about/versions/oreo/android-8.0-changes
- https://stackoverflow.com/questions/51289236/continually-running-background-service
- https://stackoverflow.com/questions/49775577/android-how-to-keep-running-the-background-service-when-app-is-killed-by-user
- https://medium.com/mindorks/android-scheduling-background-services-a-developers-nightmare-c573807c2705
