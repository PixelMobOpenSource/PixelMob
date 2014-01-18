<!DOCTYPE html>
<html lang="en">
<head>
  <title>PixelMob</title>
  <%= stylesheet_link_tag    "application", :media => "all" %>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
  <%= javascript_include_tag "application" %>
  <link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet">
  <script src="http://vjs.zencdn.net/c/video.js"></script>
  <%= csrf_meta_tags %>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%- if user_signed_in? %>
    <meta name="current-user" content="<%= UserSerializer.new(current_user, :root => false).to_json %>" />
	  <meta name="current-user-id" content="<%= current_user.id%>"/>
  <% end %>
</head>
<body>
    <%= yield %>
</body>
</html>
