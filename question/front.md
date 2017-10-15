

#### What is Angularjs.org and angular.io?
AngularJS 1.X will continue to reside at angularjs.org and Angular 2.0 will be hosted at angular.io.

The new version of Angular is not a major update, it is a complete rewrite.

***

#### pm2.json 作用 ？

***

#### What is angular platformBrowserDynamic?
[source link](https://stackoverflow.com/questions/38407604/what-is-angular-platform-browser)

Your Angular application can start off in many ways, but when you run on the browser you have a specific way of bootstrapping the application and that is defined in @angular/platform-browser-dynamic.

In short these packages contain angular features which make getting an Angular app up and running possible in the browser. Bootstrapping is essential and one of those features.

You can omit this when your target is not to develop the app to run on browser otherwise it is essential.
