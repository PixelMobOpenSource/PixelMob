!function(){var a;a=DS.attr,PixelMob.User=DS.Model.extend({resourceUrl:"/user",email:a("string"),password:a("string"),gravatar_url:a("string"),channels:DS.hasMany("PixelMob.Channel"),comments:DS.hasMany("PixelMob.Comment"),subscriptions_videos:DS.hasMany("PixelMob.Video"),subscriptions:DS.hasMany("PixelMob.Channel")}),DS.RESTAdapter.configure("plurals",{user:"user"})}.call(this),function(){var a;DS.RESTAdapter.registerTransform("json",{deserialize:function(a){return Em.isNone(a)?{}:a},serialize:function(a){return Em.isNone(a)?{}:a}}),a=DS.attr,PixelMob.Channel=DS.Model.extend({name:a("string"),description:a("string"),subscribed:a("boolean"),subscribers:DS.hasMany("PixelMob.User"),avatar:a("json"),videos:DS.hasMany("PixelMob.Video"),users:DS.hasMany("PixelMob.User"),url:function(){return"/#/channel"+this.id}})}.call(this),function(){var a;a=DS.attr,PixelMob.Comment=DS.Model.extend({body:a("string"),video:DS.belongsTo("PixelMob.Video"),user:DS.belongsTo("PixelMob.User"),parent_comment:DS.belongsTo("PixelMob.Comment"),child_comments:DS.hasMany("PixelMob.Comment")})}.call(this),function(){var a;a=DS.attr,PixelMob.Game=DS.Model.extend({name:a("string"),description:a("string"),cover:a("json"),videos:DS.hasMany("PixelMob.Video")})}.call(this),function(){var a;DS.RESTAdapter.registerTransform("json",{deserialize:function(a){return Em.isNone(a)?{}:a},serialize:function(a){return Em.isNone(a)?{}:a}}),a=DS.attr,PixelMob.Video=DS.Model.extend({name:a("string"),description:a("string"),file:a("json"),comments:DS.hasMany("PixelMob.Comment"),owned:a("boolean"),game:DS.belongsTo("PixelMob.Game"),is1080p:a("boolean"),is720p:a("boolean"),token:a("string"),url:function(){return"/#/videos/"+this.get("id")}.property("id"),channel:DS.belongsTo("PixelMob.Channel")})}.call(this);