$ ->
  $links = $('body').find('a')
  $links.each (i , e) ->
    $e = $(e)
    $e.attr('title',$e.attr('href'))
  $links.twipsy()
