!function(e){var t={};function n(o){if(t[o])return t[o].exports;var r=t[o]={i:o,l:!1,exports:{}};return e[o].call(r.exports,r,r.exports,n),r.l=!0,r.exports}n.m=e,n.c=t,n.d=function(e,t,o){n.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:o})},n.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},n.t=function(e,t){if(1&t&&(e=n(e)),8&t)return e;if(4&t&&"object"==typeof e&&e&&e.__esModule)return e;var o=Object.create(null);if(n.r(o),Object.defineProperty(o,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var r in e)n.d(o,r,function(t){return e[t]}.bind(null,r));return o},n.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};return n.d(t,"a",t),t},n.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},n.p="",n(n.s=7)}([function(e,t,n){"use strict";t.a=function(e){return e=e.substring(1),[parseInt(e.substring(0,2),16),parseInt(e.substring(2,4),16),parseInt(e.substring(4),16)]}},function(e,t,n){"use strict";var o=n(0),r=function(e,t){if(console.log(e,"make data accessor"),"string"==typeof t){const n=t;return e.includes("Color")?(console.log("is color"),e=>"string"==typeof e[n]?Object(o.a)(e[n]):e[n]):e=>e[n]}return e=>t.map(t=>e[t])};t.a=function(e,t){return t.map(function(t){const n=t.properties;return i(n),n.dataframeToD3&&(t.data=HTMLWidgets.dataframeToD3(t.data)),HTMLWidgets.shinyMode&&(n.onClick=function(t){const n={lng:t.lngLat[0],lat:t.lngLat[1],object:t.object};Shiny.onInputChange(e.id+"_onclick",n)}),n.getTooltip&&c(n),n.data=t.data,new deck[t.className](n)})};const i=function(e){for(let n of Object.keys(e)){var t=e[n];"object"==typeof t&&void 0!==t.dataAccessor&&(e[n]=r(n,t.dataAccessor))}},c=function(e){e.onHover=function({x:t,y:n,object:o}){const r=_deckGLWidget.tooltipElement;if(!o)return void(r.innerHTML="");const i=e.getTooltip(o);e.fixedTooltip||(r.style.top=n+"px",r.style.left=t+"px"),r.innerHTML=i}}},function(e,t){var n;n=function(){return this}();try{n=n||new Function("return this")()}catch(e){"object"==typeof window&&(n=window)}e.exports=n},function(e,t,n){"use strict";(function(e){var o=n(4),r=n(1),i=n(5),c=n(0),s=n(6);const a=e._deckGLWidget={colorToRGBArray:c.a,renderMapTiles:s.a,_store:{}};t.a=function(e,t,n){console.log("I am your DeckGLWidget!");const i=a._store[e.id]={},c=this;var s=null;c.renderValue=function(t){c._logVersions(),console.log("el",e,"x",t),i.element=e,c._createTooltipElement(),s=i.deckGL=Object(o.a)(e,t);const n=i.layers=Object(r.a)(e,t.layers);s.setProps({layers:n})},c.resize=function(e,t){},c.getDeckGL=function(){return s},c._logVersions=function(){console.log("deck.gl version: "+deck.version),"undefined"!=typeof mapboxgl&&console.log("mapbox-gl version: "+mapboxgl.version)},c._createTooltipElement=function(){const t=a.tooltipElement=document.createElement("div");t.id="tooltip",e.appendChild(t)}},HTMLWidgets.shinyMode&&Shiny.addCustomMessageHandler("proxythis",function(e){console.log(e);const t=HTMLWidgets.find("#"+e.id).getDeckGL();console.log("deckGL",t);const n=document.getElementById(e.id);Object(i.a)(e.x.layers);const o=Object(r.a)(n,e.x.layers);console.log(o),t.setProps({layers:o})})}).call(this,n(2))},function(e,t,n){"use strict";(function(e){t.a=function(t,o){const r=e.deck;var i={mapboxApiAccessToken:o.mapboxApiAccessToken||"",mapStyle:o.mapStyle||"",container:t.id,initialViewState:o.initialViewState||n(o),views:o.views||new r.MapView,layers:[]};return i=Object.assign(i,o.properties),new r.DeckGL(i)};var n=function(e){return{longitude:e.longitude,latitude:e.latitude,zoom:e.zoom,pitch:e.pitch,bearing:e.bearing}}}).call(this,n(2))},function(module,__webpack_exports__,__webpack_require__){"use strict";__webpack_exports__.a=function(layers){for(let i=0;i<layers.length;i++){var properties=layers[i].properties;for(let key of Object.keys(properties))if("string"==typeof properties[key])try{properties[key]=eval(properties[key])}catch(e){}}}},function(e,t,n){"use strict";t.a=function(e){const t=e.tileServer||"http://a.tile.stamen.com/toner/",{x:n,y:o,z:r,bbox:i}=e.tile,{west:c,south:s,east:a,north:l}=i;return new deck.BitmapLayer(e,{image:`${t}/${r}/${n}/${o}.png`,bounds:[c,s,a,l]})}},function(e,t,n){"use strict";n.r(t);var o=n(3);HTMLWidgets.widget({name:"deckgl",type:"output",factory:(e,t,n)=>new o.a(e,t,n)})}]);