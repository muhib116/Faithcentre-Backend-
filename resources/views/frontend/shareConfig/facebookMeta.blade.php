<!-- You can use Open Graph tags to customize link previews.
Learn more: https://developers.facebook.com/docs/sharing/webmasters -->
<meta name="og:url"           content="{{ current_url() }}" />
<meta name="og:type"          content="{{ (isset($website_type) && !empty($website_type)) ? $website_type : 'Website' }}" />
<meta name="og:title"         content="{{ isset($meta_title) ? $meta_title : "" }}" />
<meta name="og:description"   content="{{ isset($meta_description) ? $meta_description : "" }}" />
<meta name="og:image"         content="{{ (isset($share_image) && !empty($share_image)) ? $share_image : asset($header_logo) }}" />
<meta name="fb:app_id"		  content="305036946746627" />