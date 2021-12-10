+++
title= "How to deploy Hugo on Github Page"
date= 2021-12-01
draft= false
description= "This is a test page."
tags= ["hugo", "docker"]
type= "post"
+++

This is a test blog page.

If you are a Arch-Linux user, like me you probably encounter packages that are not totally up to date from times to times. 

Hugo is not an exception, as I write these lines, the package `hugo-extended` is only available in version *0.83.X* and I need the *0.86.1*. <br> 
***To do that we are gonna use docker !*** 

### The docker image 

We don't need to make our own, [@klakegg](https://github.com/klakegg/) made the image [klakegg/hugo](https://hub.docker.com/r/klakegg/hugo).

Pull it 
```bash
docker pull klakegg/hugo
```

### Run it

Basic command
```
docker run --rm -it \
    -p 1313:1313 \ 
    -v $(pwd):/src klakegg/hugo:<version> <command>
```

> **Exemple 1:** I need to run Hugo version *0.86.1* and to execute the command `hugo serve -D`.
> 
> ```
> docker run --rm -it \
>     -p 1313:1313 \
>     -v $(pwd):/src klakegg/hugo:0.86.1 serve -D
> ```

> **Exemple 2:** I need to run Hugo version *0.83.1* and to execute the command `hugo -D`.
> 
> ```
> docker run --rm -it \
>     -p 1313:1313 \
>     -v $(pwd):/src klakegg/hugo:0.83.1 -D
> ```
> Please note that we don't really need to forward any ports to build a hugo website, only to use the included webserver. 