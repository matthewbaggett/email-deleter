Matt's Email Deleter
====================
[![Build Status](https://travis-ci.org/matthewbaggett/email-deleter.svg?branch=master)](https://travis-ci.org/matthewbaggett/email-deleter)
[![](https://images.microbadger.com/badges/image/matthewbaggett/email-deleter.svg)](https://microbadger.com/images/matthewbaggett/email-deleter "Get your own image badge on microbadger.com")

So my 15 year old Gmail for Business account has about a trillion emails in it that I don't give a crap about any more. And deleting them through the UI doesn't work. So I'll delete 'em automatically over imap okay?

```bash
docker run --rm \
    --env USERNAME=you@gmail.com \
    --env PASSWORD=changeme \
    --env IMAP_SERVER=imap.gmail.com \
    --env IMAP_PORT=993 \
    --env IMAP_FLAGS="/imap/ssl/novalidate-cert" \
    --env FROM_BEFORE="2016-12-31" \
    matthewbaggett/email-deleter \
    bin/email-deleter
```

or use the provided example `docker-compose.yml`