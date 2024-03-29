+++
title= "How to deploy Hugo on Github Page"
date= 2021-12-11
draft= false
showDate= true
showReafingTime= true
description= "This is a test page."
tags= ["hugo", "docker"]
type= "blog"
+++

This page is based on the tutorial posted by [@bwaycer](https://bwaycer.github.io/hugo_tutorial.hugo/tutorials/github-pages-blog/)

According to Hugo official tutorial and congo tutorial, it is suggested to deploy site through a separate branch called `gh-pages`. This approach is a bit more complex but has some advantages:

* It keeps sources and generated HTML in two different branches
* It uses the default public folder
* It keeps the histories of source branch and gh-pages branch fully separated from each other

## Preparations

1. Add the public folder to .gitignnore.
```
echo "public" >> .gitignore
```
2. Initialize the gh-pages branch as an empty orphan branch.
```
git checkout --orphan gh-pages
git reset --hard
git commit --allow-empty -m "Initializing gh-pages branch"
git push upstream gh-pages
git checkout master
```
3. Now check out the gh-pages branch into your public folder, using git’s worktree feature (essentially, it allows you to have multiple branches of the same local repo to be checked out in different directories):
```
rm -rf public
git worktree add -B gh-pages public upstream/gh-pages
```



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