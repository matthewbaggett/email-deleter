Matt's Email Deleter
====================
[![Build Status](https://travis-ci.org/matthewbaggett/email-deleter.svg?branch=master)](https://travis-ci.org/matthewbaggett/email-deleter)
[![](https://images.microbadger.com/badges/image/matthewbaggett/email-deleter.svg)](https://microbadger.com/images/matthewbaggett/email-deleter "Get your own image badge on microbadger.com")

## What? Why?

So my 15 year old Gmail for Business account has about a _trillion frigging emails_ in it that I don't care about any more.

And deleting 10k+ emails through the UI doesn't work. 

So I'll delete 'em automatically over imap _I guess_?

## Running it

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

```yaml
version: '2.4'
services:
  email-deleter:
    image: matthewbaggett/email-deleter
    environment:
      USERNAME: matthew@baggett.me
      PASSWORD: changeme
      IMAP_SERVER: imap.gmail.com
      IMAP_PORT: 993
      IMAP_FLAGS: "/imap/ssl/novalidate-cert"
      FROM_BEFORE: "2016-12-31"
```

## Why novalidate-cert?

Because Google's Gmail product doesn't like PHP's ancient imap library's SSL gubbins and throws an error when we try to connect. 
Also because I'm a bad person and in this context I don't care.
