## Getting started
* Install [Brunch](http://brunch.io): `npm install -g brunch`.
* Install Jake: `npm install -g jake`.
* Install Brunch plugins and Bower components: `npm install & bower install`.
* Build Leaflet: `cd bower_components/leaflet && npm install && jake`
* Watch the project with continuous rebuild by
`brunch watch --server`. This will also launch HTTP server.
* `public/` dir is fully auto-generated and served by HTTP server.
* Write your code in `app` dir.
* Optionally, you can scaffold things, see readme in `generators` directory.
* For production, build minified project with `brunch build --optimize`.

See [Chaplin site](http://chaplinjs.org) for docs and more info.
