Ember.TEMPLATES._comment=Ember.Handlebars.template(function(a,b,c,d,e){function f(a,b){var d,e,f="";return b.buffer.push('\n<div class="comment">\n	<div class="media">\n		<a class="pull-left">\n			<img class="media-object" '),e={src:"ID"},b.buffer.push(l(c.bindAttr.call(a,{hash:{src:"comment.user.gravatar_url"},contexts:[],types:[],hashTypes:e,data:b}))),b.buffer.push('/>\n		</a>\n		<div class="media-body">\n			<h5 class="media-heading">'),e={},b.buffer.push(l(c._triageMustache.call(a,"comment.user.email",{hash:{},contexts:[a],types:["ID"],hashTypes:e,data:b}))),b.buffer.push("</h5>\n			"),e={},b.buffer.push(l(c._triageMustache.call(a,"comment.body",{hash:{},contexts:[a],types:["ID"],hashTypes:e,data:b}))),b.buffer.push('\n			<button class="btn btn-primary btn-mini newCommentButton" '),e={target:"STRING"},b.buffer.push(l(c.action.call(a,"newComment",{hash:{target:"view"},contexts:[a],types:["STRING"],hashTypes:e,data:b}))),b.buffer.push(" "),e={id:"STRING"},b.buffer.push(l(c.bindAttr.call(a,{hash:{id:"comment.id"},contexts:[],types:[],hashTypes:e,data:b}))),b.buffer.push(">Reply</button>\n			"),e={},d=c.each.call(a,"comment","in","comment.child_comments",{hash:{},inverse:m.noop,fn:m.program(2,g,b),contexts:[a,a,a],types:["ID","ID","ID"],hashTypes:e,data:b}),(d||0===d)&&b.buffer.push(d),b.buffer.push("\n		</div>\n	</div>\n"),f}function g(a,b){var d,e,f,g="";return b.buffer.push("\n				"),e={},f={hash:{},contexts:[a],types:["ID"],hashTypes:e,data:b},b.buffer.push(l((d=c.partial,d?d.call(a,"comment",f):k.call(a,"partial","comment",f)))),b.buffer.push("\n			"),g}this.compilerInfo=[2,">= 1.0.0-rc.3"],c=c||Ember.Handlebars.helpers,e=e||{};var h,i,j="",k=c.helperMissing,l=this.escapeExpression,m=this;return i={commentBinding:"ID"},h=c.view.call(b,"PixelMob.CommentView",{hash:{commentBinding:"comment"},inverse:m.noop,fn:m.program(1,f,e),contexts:[b],types:["ID"],hashTypes:i,data:e}),(h||0===h)&&e.buffer.push(h),e.buffer.push("\n"),j}),Ember.TEMPLATES.application=Ember.Handlebars.template(function(a,b,c,d,e){function f(a,b){b.buffer.push('\n			<div class="navBox navPart">\n				<img src="/assets/PixelMob.png" height="40px" width="40px" ></img>\n				<i class="icon-angle-down navBoxArrow icon-2x"></i>\n			</div>\n			')}function g(a,b){var d,e,f,g,j="";return b.buffer.push('\n			<div class="navBoxSlideDown navPart">\n				<div class="icon">'),f={},g={hash:{},inverse:r.noop,fn:r.program(4,h,b),contexts:[a],types:["ID"],hashTypes:f,data:b},d=c.linkTo,e=d?d.call(a,"subscriptions",g):s.call(a,"linkTo","subscriptions",g),(e||0===e)&&b.buffer.push(e),b.buffer.push("</div>\n				"),f={},e=c["if"].call(a,"controllers.currentUser",{hash:{},inverse:r.program(11,l,b),fn:r.program(6,i,b),contexts:[a],types:["ID"],hashTypes:f,data:b}),(e||0===e)&&b.buffer.push(e),b.buffer.push('\n				<i class="icon-angle-up navBoxArrow icon-2x"></i>\n			</div>\n			'),j}function h(a,b){b.buffer.push('<i class="icon-home icon-3x"></i>')}function i(a,b){var d,e,f,g,h="";return b.buffer.push('\n				<div class="icon">'),f={},g={hash:{},inverse:r.noop,fn:r.program(7,j,b),contexts:[a],types:["ID"],hashTypes:f,data:b},d=c.linkTo,e=d?d.call(a,"upload_file",g):s.call(a,"linkTo","upload_file",g),(e||0===e)&&b.buffer.push(e),b.buffer.push('</div>\n					<div class="icon">'),f={},g={hash:{},inverse:r.noop,fn:r.program(9,k,b),contexts:[a],types:["ID"],hashTypes:f,data:b},d=c.linkTo,e=d?d.call(a,"signoff",g):s.call(a,"linkTo","signoff",g),(e||0===e)&&b.buffer.push(e),b.buffer.push('</div>\n					<div class="icon img"><a><img '),f={src:"ID"},b.buffer.push(t(c.bindAttr.call(a,{hash:{src:"controllers.currentUser.gravatar_url"},contexts:[],types:[],hashTypes:f,data:b}))),b.buffer.push(" ></a></div>\n				"),h}function j(a,b){b.buffer.push('<i class="icon-cloud-upload icon-3x"></i>')}function k(a,b){b.buffer.push('<i class="icon-signout icon-3x"></i>')}function l(a,b){var d,e,f,g,h="";return b.buffer.push('\n				<div class="icon">'),f={},g={hash:{},inverse:r.noop,fn:r.program(12,m,b),contexts:[a],types:["ID"],hashTypes:f,data:b},d=c.linkTo,e=d?d.call(a,"signin",g):s.call(a,"linkTo","signin",g),(e||0===e)&&b.buffer.push(e),b.buffer.push("</div>\n				"),h}function m(a,b){b.buffer.push('<i class="icon-signin icon-3x"/></i>')}function n(a,b){var d,e="";return b.buffer.push('\n<div class="searchContainer">\n		<div class="searchBox">\n			<form class="form-search">\n				<div class="input-append">\n					'),d={valueBinding:"STRING","class":"STRING"},b.buffer.push(t(c.view.call(a,"Ember.TextField",{hash:{valueBinding:"view.search","class":"input-medium search-query"},contexts:[a],types:["ID"],hashTypes:d,data:b}))),b.buffer.push("\n					<button "),d={},b.buffer.push(t(c.action.call(a,"search","view.search",{hash:{},contexts:[a,a],types:["STRING","ID"],hashTypes:d,data:b}))),b.buffer.push(' type="submit" class="btn">Search</button>\n				</div>\n			</form>\n		</div>\n	</div>\n'),e}this.compilerInfo=[2,">= 1.0.0-rc.3"],c=c||Ember.Handlebars.helpers,e=e||{};var o,p,q="",r=this,s=c.helperMissing,t=this.escapeExpression;return e.buffer.push('<div id="wrap">\n	<div class="navContainer">\n		<div class="nav">\n			'),p={},o=c.view.call(b,"PixelMob.SlidableNavView",{hash:{},inverse:r.noop,fn:r.program(1,f,e),contexts:[b],types:["ID"],hashTypes:p,data:e}),(o||0===o)&&e.buffer.push(o),e.buffer.push("\n			"),p={},o=c.view.call(b,"PixelMob.SlidableNavView",{hash:{},inverse:r.noop,fn:r.program(3,g,e),contexts:[b],types:["ID"],hashTypes:p,data:e}),(o||0===o)&&e.buffer.push(o),e.buffer.push("\n	</div>\n	</div>\n"),p={},o=c.view.call(b,"PixelMob.SearchView",{hash:{},inverse:r.noop,fn:r.program(14,n,e),contexts:[b],types:["ID"],hashTypes:p,data:e}),(o||0===o)&&e.buffer.push(o),e.buffer.push('\n	<div id="main" class="container clear-top">\n		'),p={},e.buffer.push(t(c._triageMustache.call(b,"outlet",{hash:{},contexts:[b],types:["ID"],hashTypes:p,data:e}))),e.buffer.push('\n	</div>\n</div>\n<footer class="footer">\n	 PixelMob &copy; Sascha Wise 2012-2013\n</footer>\n'),q}),Ember.TEMPLATES.channel=Ember.Handlebars.template(function(a,b,c,d,e){function f(a,b){var d,e,f,g="";return b.buffer.push("\n		"),e={},f={hash:{},contexts:[a],types:["ID"],hashTypes:e,data:b},b.buffer.push(k((d=c.partial,d?d.call(a,"thumbnail",f):j.call(a,"partial","thumbnail",f)))),b.buffer.push("\n	"),g}this.compilerInfo=[2,">= 1.0.0-rc.3"],c=c||Ember.Handlebars.helpers,e=e||{};var g,h,i="",j=c.helperMissing,k=this.escapeExpression,l=this;return e.buffer.push('<div class="span3"><img class="largeImage" '),h={src:"ID"},e.buffer.push(k(c.bindAttr.call(b,{hash:{src:"avatar.avatar.url"},contexts:[],types:[],hashTypes:h,data:e}))),e.buffer.push('></img></div>\n<div class="span6">'),h={},e.buffer.push(k(c._triageMustache.call(b,"description",{hash:{},contexts:[b],types:["ID"],hashTypes:h,data:e}))),e.buffer.push("</div>\n<legend>"),h={},e.buffer.push(k(c._triageMustache.call(b,"name",{hash:{},contexts:[b],types:["ID"],hashTypes:h,data:e}))),e.buffer.push('</legend>\n<ul class="thumbnails">\n  '),h={},g=c.each.call(b,"video","in","videos",{hash:{},inverse:l.noop,fn:l.program(1,f,e),contexts:[b,b,b],types:["ID","ID","ID"],hashTypes:h,data:e}),(g||0===g)&&e.buffer.push(g),e.buffer.push("\n</ul>\n"),i}),Ember.TEMPLATES.dashboard=Ember.Handlebars.template(function(a,b,c,d,e){function f(a,b){var d,e="";return b.buffer.push("\n		<option "),d={value:"STRING"},b.buffer.push(j(c.bindAttr.call(a,{hash:{value:"channel.id"},contexts:[],types:[],hashTypes:d,data:b}))),b.buffer.push(">"),d={},b.buffer.push(j(c._triageMustache.call(a,"channel.name",{hash:{},contexts:[a],types:["ID"],hashTypes:d,data:b}))),b.buffer.push("</option>\n	"),e}this.compilerInfo=[2,">= 1.0.0-rc.3"],c=c||Ember.Handlebars.helpers,e=e||{};var g,h,i="",j=this.escapeExpression,k=this;return h={},e.buffer.push(j(c._triageMustache.call(b,"controllers.currentUser.gravatar_url",{hash:{},contexts:[b],types:["ID"],hashTypes:h,data:e}))),e.buffer.push('\n<select name="channels">\n	'),h={},g=c.each.call(b,"channel","in","controllers.currentUser.channels",{hash:{},inverse:k.noop,fn:k.program(1,f,e),contexts:[b,b,b],types:["ID","ID","ID"],hashTypes:h,data:e}),(g||0===g)&&e.buffer.push(g),e.buffer.push("\n</select>\n"),i}),Ember.TEMPLATES.edit_video=Ember.Handlebars.template(function(a,b,c,d,e){function f(a,b){var d,e="";return b.buffer.push("\n			"),d={},b.buffer.push(q(c._triageMustache.call(a,"channel.name",{hash:{},contexts:[a],types:["ID"],hashTypes:d,data:b}))),b.buffer.push("\n		"),e}function g(a,b){var d,e="";return b.buffer.push("\n			"),d={},b.buffer.push(q(c._triageMustache.call(a,"game.title",{hash:{},contexts:[a],types:["ID"],hashTypes:d,data:b}))),b.buffer.push("\n		"),e}function h(a,b){var d,e,f;e={},f={hash:{},contexts:[a],types:["ID"],hashTypes:e,data:b},b.buffer.push(q((d=c.partial,d?d.call(a,"subscribe",f):r.call(a,"partial","subscribe",f))))}function i(a,b){var d,e="";return b.buffer.push("<source "),d={src:"ID"},b.buffer.push(q(c.bindAttr.call(a,{hash:{src:"file.file.hd1080p.url"},contexts:[],types:[],hashTypes:d,data:b}))),b.buffer.push(' type="video/mp4"/>'),e}function j(a,b){var d,e="";return b.buffer.push("<source "),d={src:"ID"},b.buffer.push(q(c.bindAttr.call(a,{hash:{src:"file.file.hd720p.url"},contexts:[],types:[],hashTypes:d,data:b}))),b.buffer.push(' type="video/mp4"/>'),e}function k(a,b){var d,e="";return b.buffer.push("<source "),d={src:"ID"},b.buffer.push(q(c.bindAttr.call(a,{hash:{src:"file.file.sd.url"},contexts:[],types:[],hashTypes:d,data:b}))),b.buffer.push(' type="video/mp4"/>'),e}this.compilerInfo=[2,">= 1.0.0-rc.3"],c=c||Ember.Handlebars.helpers,e=e||{};var l,m,n,o,p="",q=this.escapeExpression,r=c.helperMissing,s=this;return e.buffer.push('<div id="header">\n	<div style="font-size:24px;">\n		<input type="text" id="name" '),n={value:"STRING"},e.buffer.push(q(c.bindAttr.call(b,{hash:{value:"name"},contexts:[],types:[],hashTypes:n,data:e}))),e.buffer.push('/>\n		<span style="font-size:15px;">\n		by '),n={},o={hash:{},inverse:s.noop,fn:s.program(1,f,e),contexts:[b,b],types:["ID","ID"],hashTypes:n,data:e},l=c.linkTo,m=l?l.call(b,"channel","channel",o):r.call(b,"linkTo","channel","channel",o),(m||0===m)&&e.buffer.push(m),e.buffer.push(" playing\n		"),n={},o={hash:{},inverse:s.noop,fn:s.program(3,g,e),contexts:[b,b],types:["ID","ID"],hashTypes:n,data:e},l=c.linkTo,m=l?l.call(b,"game","game",o):r.call(b,"linkTo","game","game",o),(m||0===m)&&e.buffer.push(m),e.buffer.push('\n	</div>\n	<div style="font-size:15px;"> '),n={},m=c.view.call(b,"PixelMob.SubscribeButtonView",{hash:{},inverse:s.noop,fn:s.program(5,h,e),contexts:[b],types:["ID"],hashTypes:n,data:e}),(m||0===m)&&e.buffer.push(m),e.buffer.push(' </div>\n</div>	\n<video id="video" controls class="video-js vjs-default-skin " preload="none" width="640" height="360" '),n={poster:"ID"},e.buffer.push(q(c.bindAttr.call(b,{hash:{poster:"file.file.poster.url"},contexts:[],types:[],hashTypes:n,data:e}))),e.buffer.push(">\n		"),n={},m=c["if"].call(b,"is1080p",{hash:{},inverse:s.noop,fn:s.program(7,i,e),contexts:[b],types:["ID"],hashTypes:n,data:e}),(m||0===m)&&e.buffer.push(m),e.buffer.push("\n		"),n={},m=c["if"].call(b,"is720p",{hash:{},inverse:s.noop,fn:s.program(9,j,e),contexts:[b],types:["ID"],hashTypes:n,data:e}),(m||0===m)&&e.buffer.push(m),e.buffer.push("\n		"),n={},m=c.unless.call(b,"is720p",{hash:{},inverse:s.noop,fn:s.program(11,k,e),contexts:[b],types:["ID"],hashTypes:n,data:e}),(m||0===m)&&e.buffer.push(m),e.buffer.push("\n</video>\n"),n={"class":"STRING",id:"STRING",valueBinding:"STRING"},e.buffer.push(q(c.view.call(b,"Ember.TextArea",{hash:{"class":"wysihtml5",id:"description",valueBinding:"description"},contexts:[b],types:["ID"],hashTypes:n,data:e}))),e.buffer.push('</br>\n<button class="btn" '),n={target:"STRING"},e.buffer.push(q(c.action.call(b,"save",{hash:{target:"view"},contexts:[b],types:["STRING"],hashTypes:n,data:e}))),e.buffer.push(">Save</button>\n"),p}),Ember.TEMPLATES.game=Ember.Handlebars.template(function(a,b,c,d,e){function f(a,b){var d,e,f,g="";return b.buffer.push("\n	"),e={},f={hash:{},contexts:[a],types:["ID"],hashTypes:e,data:b},b.buffer.push(k((d=c.partial,d?d.call(a,"thumbnail",f):j.call(a,"partial","thumbnail",f)))),b.buffer.push("\n"),g}this.compilerInfo=[2,">= 1.0.0-rc.3"],c=c||Ember.Handlebars.helpers,e=e||{};var g,h,i="",j=c.helperMissing,k=this.escapeExpression,l=this;return e.buffer.push('<div class="span2"><img '),h={src:"ID"},e.buffer.push(k(c.bindAttr.call(b,{hash:{src:"cover.cover.url"},contexts:[],types:[],hashTypes:h,data:e}))),e.buffer.push(' class="largeImage" style="height:200px;"></img></div>\n<div class="span6">'),h={},e.buffer.push(k(c._triageMustache.call(b,"description",{hash:{},contexts:[b],types:["ID"],hashTypes:h,data:e}))),e.buffer.push("</div>\n<legend>"),h={},e.buffer.push(k(c._triageMustache.call(b,"name",{hash:{},contexts:[b],types:["ID"],hashTypes:h,data:e}))),e.buffer.push('</legend>\n<ul class="thumbnails">\n'),h={},g=c.each.call(b,"video","in","videos",{hash:{},inverse:l.noop,fn:l.program(1,f,e),contexts:[b,b,b],types:["ID","ID","ID"],hashTypes:h,data:e}),(g||0===g)&&e.buffer.push(g),e.buffer.push("\n</ul>\n"),i}),Ember.TEMPLATES.new_channel=Ember.Handlebars.template(function(a,b,c,d,e){this.compilerInfo=[2,">= 1.0.0-rc.3"],c=c||Ember.Handlebars.helpers,e=e||{},e.buffer.push('	<fieldset>\n		<legend>New Channel</legend> \n		<label>Name</label>\n		<input id="name" name="name" type="TEXT"/></br>\n		<input id="file" type="file"/></br>\n		<button  id="submit" class="btn">New Channel</button>\n	</fieldset>\n')}),Ember.TEMPLATES.pagenotfound=Ember.Handlebars.template(function(a,b,c,d,e){this.compilerInfo=[2,">= 1.0.0-rc.3"],c=c||Ember.Handlebars.helpers,e=e||{},e.buffer.push("<h1>404 Page Not Found</h1>\n")}),Ember.TEMPLATES.signin=Ember.Handlebars.template(function(a,b,c,d,e){function f(a,b){b.buffer.push('<button type="submit" class="btn" >Log In</button>')}this.compilerInfo=[2,">= 1.0.0-rc.3"],c=c||Ember.Handlebars.helpers,e=e||{};var g,h,i="",j=this,k=this.escapeExpression;return e.buffer.push('	<fieldset>\n		<legend>Sign In</legend>\n		<label>Email</label>\n		<div class="input-prepend">\n			<span class="add-on">@</span>\n			<input type="TEXT" id="email"/>\n		</div>\n		<label>Password</label>\n		<input type="PASSWORD" id="password"/></br>\n		'),h={},g=c.view.call(b,"PixelMob.LoginButtonView",{hash:{},inverse:j.noop,fn:j.program(1,f,e),contexts:[b],types:["ID"],hashTypes:h,data:e}),(g||0===g)&&e.buffer.push(g),e.buffer.push("\n	</fieldset>\n"),h={},e.buffer.push(k(c._triageMustache.call(b,"outlet",{hash:{},contexts:[b],types:["ID"],hashTypes:h,data:e}))),e.buffer.push("\n"),i}),Ember.TEMPLATES.signoff=Ember.Handlebars.template(function(a,b,c,d,e){this.compilerInfo=[2,">= 1.0.0-rc.3"],c=c||Ember.Handlebars.helpers,e=e||{};var f,g="",h=this.escapeExpression;return e.buffer.push("<h1>Signoff</h1>\n\n<p>Your content here.</p>\n\n"),f={},e.buffer.push(h(c._triageMustache.call(b,"outlet",{hash:{},contexts:[b],types:["ID"],hashTypes:f,data:e}))),e.buffer.push("\n"),g}),Ember.TEMPLATES.signup=Ember.Handlebars.template(function(a,b,c,d,e){this.compilerInfo=[2,">= 1.0.0-rc.3"],c=c||Ember.Handlebars.helpers,e=e||{};var f,g="",h=this.escapeExpression;return e.buffer.push('<fieldset>\n	<legend>Sign Up</legend>\n	<label>Email</label>\n	<div class="input-prepend">\n		<span class="add-on"><i class="icon-envelope"></i></span>\n		<input type="TEXT" id="email"/>\n	</div>\n	<label>Password</label>\n	<div class="input-prepend">\n		<span class="add-on"><i class="icon-key"></i></span>\n		<input type="password" id="pass"/>\n	</div>\n	<br/>\n	<button '),f={target:"STRING"},e.buffer.push(h(c.action.call(b,"singUp",{hash:{target:"view"},contexts:[b],types:["STRING"],hashTypes:f,data:e}))),e.buffer.push('type="submit" class="btn btn-primary">Sign Up</button>\n</fieldset>\n'),g}),Ember.TEMPLATES.subscriptions=Ember.Handlebars.template(function(a,b,c,d,e){function f(a,b){var d,e,f,g="";return b.buffer.push("\n	"),e={},f={hash:{},contexts:[a],types:["ID"],hashTypes:e,data:b},b.buffer.push(k((d=c.partial,d?d.call(a,"thumbnail",f):j.call(a,"partial","thumbnail",f)))),b.buffer.push("	\n"),g}this.compilerInfo=[2,">= 1.0.0-rc.3"],c=c||Ember.Handlebars.helpers,e=e||{};var g,h,i="",j=c.helperMissing,k=this.escapeExpression,l=this;return e.buffer.push('<ul class="thumbnails">\n'),h={},g=c.each.call(b,"video","in","controllers.currentUser.subscriptions_videos",{hash:{},inverse:l.noop,fn:l.program(1,f,e),contexts:[b,b,b],types:["ID","ID","ID"],hashTypes:h,data:e}),(g||0===g)&&e.buffer.push(g),e.buffer.push("\n</ul>\n"),i}),Ember.TEMPLATES.upload_container=Ember.Handlebars.template(function(a,b,c,d,e){this.compilerInfo=[2,">= 1.0.0-rc.3"],c=c||Ember.Handlebars.helpers,e=e||{};var f,g="",h=this.escapeExpression;return e.buffer.push("<h1>UploadContainer</h1>\n\n<p>Your content here.</p>\n\n"),f={},e.buffer.push(h(c._triageMustache.call(b,"outlet",{hash:{},contexts:[b],types:["ID"],hashTypes:f,data:e}))),e.buffer.push("\n"),g}),Ember.TEMPLATES.upload_file=Ember.Handlebars.template(function(a,b,c,d,e){this.compilerInfo=[2,">= 1.0.0-rc.3"],c=c||Ember.Handlebars.helpers,e=e||{},e.buffer.push('<div id="videoForum">\n  <forum name="video" type="post">\n    <legend> Choose a File to Upload</legend>\n    <input id="fileupload" type="file" name="file"/>\n    <div class="progress">\n			<div class="bar" style="width: 0%;"></div>\n    </div>	\n		<span id="uploadSpeed"></span>\n		<span id="uploadTime"></span>\n  </div>\n </div>\n')}),Ember.TEMPLATES.video=Ember.Handlebars.template(function(a,b,c,d,e){function f(a,b){var d,e,f,h,i="";return b.buffer.push("\n		"),f={},h={hash:{},inverse:y.noop,fn:y.program(2,g,b),contexts:[a,a],types:["STRING","ID"],hashTypes:f,data:b},d=c.linkTo,e=d?d.call(a,"edit_video","",h):z.call(a,"linkTo","edit_video","",h),(e||0===e)&&b.buffer.push(e),b.buffer.push("\n		"),i}function g(a,b){b.buffer.push('\n			<button class="btn btn-primary btn-mini">Edit</button> ')}function h(a,b){var d,e="";return b.buffer.push("\n			"),d={},b.buffer.push(A(c._triageMustache.call(a,"channel.name",{hash:{},contexts:[a],types:["ID"],hashTypes:d,data:b}))),b.buffer.push("\n		"),e}function i(a,b){var d,e="";return b.buffer.push("\n			"),d={},b.buffer.push(A(c._triageMustache.call(a,"game.title",{hash:{},contexts:[a],types:["ID"],hashTypes:d,data:b}))),b.buffer.push("\n			"),e}function j(a,b){var d,e,f;e={},f={hash:{},contexts:[a],types:["ID"],hashTypes:e,data:b},b.buffer.push(A((d=c.partial,d?d.call(a,"subscribe",f):z.call(a,"partial","subscribe",f))))}function k(a,b){var d,e="";return b.buffer.push("<source "),d={src:"ID"},b.buffer.push(A(c.bindAttr.call(a,{hash:{src:"file.file.hd1080p.url"},contexts:[],types:[],hashTypes:d,data:b}))),b.buffer.push(' type="video/mp4"/>'),e}function l(a,b){var d,e="";return b.buffer.push("<source "),d={src:"ID"},b.buffer.push(A(c.bindAttr.call(a,{hash:{src:"file.file.hd720p.url"},contexts:[],types:[],hashTypes:d,data:b}))),b.buffer.push(' type="video/mp4"/>'),e}function m(a,b){var d,e="";return b.buffer.push("<source "),d={src:"ID"},b.buffer.push(A(c.bindAttr.call(a,{hash:{src:"file.file.sd.url"},contexts:[],types:[],hashTypes:d,data:b}))),b.buffer.push(' type="video/mp4"/>'),e}function n(a,b){var d,e="";return b.buffer.push('<li><a tabindex="-1" '),d={target:"STRING"},b.buffer.push(A(c.action.call(a,"q1080p",{hash:{target:"view"},contexts:[a],types:["STRING"],hashTypes:d,data:b}))),b.buffer.push(">1080p</a></li>"),e}function o(a,b){var d,e="";return b.buffer.push('<li><a tabindex="-1" '),d={target:"STRING"},b.buffer.push(A(c.action.call(a,"q720p",{hash:{target:"view"},contexts:[a],types:["STRING"],hashTypes:d,data:b}))),b.buffer.push(' href="#">720p</a></li>'),e}function p(a,b){var d,e="";return b.buffer.push('\n	<button class="btn btn-primary btn-mini newCommentButton" '),d={target:"STRING"},b.buffer.push(A(c.action.call(a,"newComment",{hash:{target:"view"},contexts:[a],types:["STRING"],hashTypes:d,data:b}))),b.buffer.push(" "),d={id:"STRING"},b.buffer.push(A(c.bindAttr.call(a,{hash:{id:"comment.id"},contexts:[],types:[],hashTypes:d,data:b}))),b.buffer.push(">Reply</button>\n"),e}function q(a,b){var d,e,f="";return b.buffer.push("\n		"),e={},d=c["if"].call(a,"comment.parent_comment",{hash:{},inverse:y.program(25,s,b),fn:y.program(23,r,b),contexts:[a],types:["ID"],hashTypes:e,data:b}),(d||0===d)&&b.buffer.push(d),b.buffer.push("\n	"),f}function r(a,b){b.buffer.push(" ")}function s(a,b){var d,e,f,g="";return b.buffer.push("\n			"),e={},f={hash:{},contexts:[a],types:["ID"],hashTypes:e,data:b},b.buffer.push(A((d=c.partial,d?d.call(a,"comment",f):z.call(a,"partial","comment",f)))),b.buffer.push("\n		"),g}this.compilerInfo=[2,">= 1.0.0-rc.3"],c=c||Ember.Handlebars.helpers,e=e||{};var t,u,v,w,x="",y=this,z=c.helperMissing,A=this.escapeExpression;return e.buffer.push('<div id="header">\n	<div style="font-size:24px;">\n		'),v={},t=c["if"].call(b,"owned",{hash:{},inverse:y.noop,fn:y.program(1,f,e),contexts:[b],types:["ID"],hashTypes:v,data:e}),(t||0===t)&&e.buffer.push(t),e.buffer.push("\n		"),v={},e.buffer.push(A(c._triageMustache.call(b,"name",{hash:{},contexts:[b],types:["ID"],hashTypes:v,data:e}))),e.buffer.push(' \n		<span style="font-size:15px;">\n		by '),v={},w={hash:{},inverse:y.noop,fn:y.program(4,h,e),contexts:[b,b],types:["ID","ID"],hashTypes:v,data:e},t=c.linkTo,u=t?t.call(b,"channel","channel",w):z.call(b,"linkTo","channel","channel",w),(u||0===u)&&e.buffer.push(u),e.buffer.push(" playing\n		"),v={},w={hash:{},inverse:y.noop,fn:y.program(6,i,e),contexts:[b,b],types:["ID","ID"],hashTypes:v,data:e},t=c.linkTo,u=t?t.call(b,"game","game",w):z.call(b,"linkTo","game","game",w),(u||0===u)&&e.buffer.push(u),e.buffer.push('\n	</div>\n	<div style="font-size:15px;"> '),v={},u=c.view.call(b,"PixelMob.SubscribeButtonView",{hash:{},inverse:y.noop,fn:y.program(8,j,e),contexts:[b],types:["ID"],hashTypes:v,data:e}),(u||0===u)&&e.buffer.push(u),e.buffer.push(' </div>\n</div>\n	<video id="video" controls class="video-js vjs-default-skin " preload="none" width="640" height="360" '),v={poster:"ID"},e.buffer.push(A(c.bindAttr.call(b,{hash:{poster:"file.file.poster.url"},contexts:[],types:[],hashTypes:v,data:e}))),e.buffer.push(">\n		"),v={},u=c["if"].call(b,"is1080p",{hash:{},inverse:y.noop,fn:y.program(10,k,e),contexts:[b],types:["ID"],hashTypes:v,data:e}),(u||0===u)&&e.buffer.push(u),e.buffer.push("\n		"),v={},u=c["if"].call(b,"is720p",{hash:{},inverse:y.noop,fn:y.program(12,l,e),contexts:[b],types:["ID"],hashTypes:v,data:e}),(u||0===u)&&e.buffer.push(u),e.buffer.push("\n		"),v={},u=c.unless.call(b,"is720p",{hash:{},inverse:y.noop,fn:y.program(14,m,e),contexts:[b],types:["ID"],hashTypes:v,data:e}),(u||0===u)&&e.buffer.push(u),e.buffer.push("\n	</video>\n<p>"),v={unescaped:"STRING"},u=c._triageMustache.call(b,"description",{hash:{unescaped:"true"},contexts:[b],types:["ID"],hashTypes:v,data:e}),(u||0===u)&&e.buffer.push(u),e.buffer.push('</p>\n<div class="btn-group">\n	<a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">\n		<i class="icon-cog"></i>\n		<span class="caret"></span>\n	</a>\n	<ul class="dropdown-menu">\n		'),v={},u=c["if"].call(b,"is1080p",{hash:{},inverse:y.noop,fn:y.program(16,n,e),contexts:[b],types:["ID"],hashTypes:v,data:e}),(u||0===u)&&e.buffer.push(u),e.buffer.push("\n		"),v={},u=c["if"].call(b,"is720p",{hash:{},inverse:y.noop,fn:y.program(18,o,e),contexts:[b],types:["ID"],hashTypes:v,data:e}),(u||0===u)&&e.buffer.push(u),e.buffer.push('\n		<li><a tabindex="-1" '),v={target:"STRING"},e.buffer.push(A(c.action.call(b,"q360p",{hash:{target:"view"},contexts:[b],types:["STRING"],hashTypes:v,data:e}))),e.buffer.push('>360p</a></li>\n		<li class="divider"></li>\n		<li><a tabindex="-1" '),v={target:"STRING"},e.buffer.push(A(c.action.call(b,"large",{hash:{target:"view"},contexts:[b],types:["STRING"],hashTypes:v,data:e}))),e.buffer.push('>Large</a></li>\n		<li><a tabindex="-1" '),v={target:"STRING"},e.buffer.push(A(c.action.call(b,"small",{hash:{target:"view"},contexts:[b],types:["STRING"],hashTypes:v,data:e}))),e.buffer.push(">Small</a></li>\n	</ul>\n</div>\n"),v={},u=c.view.call(b,"PixelMob.CommentView",{hash:{},inverse:y.noop,fn:y.program(20,p,e),contexts:[b],types:["ID"],hashTypes:v,data:e}),(u||0===u)&&e.buffer.push(u),e.buffer.push('\n<div id="comments">\n	'),v={},u=c.each.call(b,"comment","in","comments",{hash:{},inverse:y.noop,fn:y.program(22,q,e),contexts:[b,b,b],types:["ID","ID","ID"],hashTypes:v,data:e}),(u||0===u)&&e.buffer.push(u),e.buffer.push("\n</div>\n"),x}),Ember.TEMPLATES.videos=Ember.Handlebars.template(function(a,b,c,d,e){function f(a,b){var d,e,f,g="";return b.buffer.push("\n	"),e={},f={hash:{},contexts:[a],types:["ID"],hashTypes:e,data:b},b.buffer.push(k((d=c.partial,d?d.call(a,"thumbnail",f):j.call(a,"partial","thumbnail",f)))),b.buffer.push("\n"),g}this.compilerInfo=[2,">= 1.0.0-rc.3"],c=c||Ember.Handlebars.helpers,e=e||{};var g,h,i="",j=c.helperMissing,k=this.escapeExpression,l=this;return e.buffer.push('<legend>Videos</legend>\n<div class="btn-group" data-toggle="buttons-radio">\n	<button class="btn btn-primary" type="button" '),h={},e.buffer.push(k(c.action.call(b,"sort","name",{hash:{},contexts:[b,b],types:["STRING","STRING"],hashTypes:h,data:e}))),e.buffer.push('>Sort By Name</button>\n	<button class="btn btn-primary" type="button" '),h={},e.buffer.push(k(c.action.call(b,"sort","description",{hash:{},contexts:[b,b],types:["STRING","STRING"],hashTypes:h,data:e}))),e.buffer.push('>Sort By Description</button>\n</div>\n<button class="btn" '),h={},e.buffer.push(k(c.action.call(b,"toggleAcending",{hash:{},contexts:[b],types:["STRING"],hashTypes:h,data:e}))),e.buffer.push(' >Toggle Acending</button>\n<ul class="thumbnails">\n'),h={},g=c.each.call(b,"video","in","controller",{hash:{},inverse:l.noop,fn:l.program(1,f,e),contexts:[b,b,b],types:["ID","ID","ID"],hashTypes:h,data:e}),(g||0===g)&&e.buffer.push(g),e.buffer.push("\n</ul>\n\n"),i});