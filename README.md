<a name="logo"/>
<div align="center">
<a href="http://juliaquantum.github.io/" target="_blank">
<img src="images/logo_icon.png" alt="JuliaQuantum Logo" height="60"></img>
</a>
</div>

<a name="Textlogo"/>
<div align="center">
<a href="http://juliaquantum.github.io/" target="_blank">
<img src="images/logo_hires.png" alt="JuliaQuantum Logo in Text" height="100"></img>
</a>
</div>


##

This is the GitHub repository for the JuliaQuantum organization's main website, [juliaquantum.github.io](http://juliaquantum.github.io/). On the [issue page](https://github.com/JuliaQuantum/JuliaQuantum.github.io/issues), announcements and discussions regarding the JuliaQuantum organization are also actively posted. The overall roadmap for the organization can be found in the [Roadmap project page](https://github.com/JuliaQuantum/Roadmap). The list of current projects under JuliaQuantum can be viewed on the organization's [GitHub summary page](https://github.com/JuliaQuantum).

To contribute to an existing project under JuliaQuantum, just go to the [corresponding repository](https://github.com/JuliaQuantum) and start forking, committing or posting issues. The [Basic Agreement](https://github.com/JuliaQuantum/JuliaQuantum.github.io/issues/3) describes some common knowledge for contributing.


## How to Edit the Website

The JuliaQuantum Website is generated in a blogging style using GitHub pages and Jekyll,
follow [these instructions](https://help.github.com/articles/using-jekyll-with-pages).

There are many ways to edit and preview the website.
In general, you can either stick to an online tool like [Prose](http://prose.io) or do so offline.

To edit and preview offline, be sure you have ruby installed,
`$ gem install bundler` to install bundler, run `$ bundle install` from the root of this repository.
You only have to do this once.

Now you can run `$ bundle exec jekyll serve` in the root of this repository to serve it,
usually you can preview the website on `http://localhost:4000`.
Drafts should be put into the `drafts/_posts` folder and can be previewed on a local computer.
All posts should be named using the correct date of posting and a title joined by hyphens.
