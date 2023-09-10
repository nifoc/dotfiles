export def instagram-dl [name: string url: string] {
  print $"== ($name)"

  let sleep = (random integer 11..15)
  let sleep_req = (random integer 10..13)
  let gdl_cookies = $"($env.HOME)/Pictures/Instagram/instagram.com_cookies.txt"

  (gallery-dl
     --directory $"($env.HOME)/Pictures/Instagram/($name)/"
     --download-archive $"($env.HOME)/Pictures/Instagram/($name)/.archive"
     --filename '{username}-{date:%Y-%m-%d}-{sidecar_media_id:?/_/}{media_id}.{extension}'
     --config $"($env.HOME)/Pictures/Instagram/gallery-dl-generic.conf"
     --cookies $gdl_cookies
     --sleep $sleep
     --sleep-request $sleep_req
     --sleep-extractor $sleep_req
     -vv
     $url)
}

def bdfr-browser-import [] {
  http post https://bdfr.internal.kempkens.network/_import_changes ''
}

export def bdfr [
  --limit (-L): int = 10
  --sort (-S): string = "hot"
] {
  ssh -t mediaserver bdfr -L $limit -S $sort --authenticate
  bdfr-browser-import
}

export def bdfr-subreddit [
  $subreddit: string
  --sort (-S): string = "hot"
] {
  ssh -t mediaserver bdfr-raw -s $subreddit -S $sort --authenticate
  bdfr-browser-import
}

export def bdfr-user [$user: string] {
  ssh -t mediaserver bdfr-raw --user $user --submitted --all-comments --comment-context --authenticate
  bdfr-browser-import
}
