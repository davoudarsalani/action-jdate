# Download/install the latest version of jcal
<div align='center'>
<img alt='last-commit' src='https://img.shields.io/github/last-commit/davoudarsalani/action-jcal?&labelColor=black&color=grey&style=flat'>
<img alt='commit-activity' src='https://img.shields.io/github/commit-activity/m/davoudarsalani/action-jcal?&labelColor=black&color=grey&style=flat'>
</div>
<br>

#### There are five choices for `source` in order for jcal to be downloaded/used:
* `docker` will pull [this](https://hub.docker.com/repository/docker/davoudarsalani/jcal) docker image/repository (about 70MB in size) in which [jdatetime](https://pypi.org/project/jdatetime/) python module is installed on Alpine Linux
* `clone-github` will clone the git repository from __github.com__
* `clone-gnu` will clone the git repository from __gnu.org__
* `gnu` will download the tar.gz file from __gnu.org__
* `askapache` will download the tar.gz file from __askapache.com__ 

```yml
- name: Installing jcal
  uses: davoudarsalani/action-jcal@master
  with:
    source:        ## default: 'docker' (options: 'docker'/'clone-github'/'clone-gnu'/'gnu'/'askapache')
    set_timezone:  ## default: true
    timezone:      ## default: 'Asia/Tehran'
```
<br>

* Jalali Calendar [main page](http://www.nongnu.org/jcal/)
* To install jdatetime python module, please visit [pypi.org](https://pypi.org/project/jdatetime/)
* To clone jcal repository, please visit [github.com](https://github.com/ashkang/jcal) or [gnu.org](http://git.savannah.gnu.org/cgit/jcal.git)
* To download jcal in tar.gz, please visit [gnu.org](http://download-mirror.savannah.gnu.org/releases/jcal/) or [askapache.com](http://nongnu.askapache.com/jcal/)
* For instructions on how to manually download and install jcal, please visit [wiki.ubuntu.ir](https://wiki.ubuntu.ir/wiki/Jcal) or [wiki.ubuntu.ir](https://wiki.ubuntu.ir/index.php?title=Jcal&oldid=1300)
* For instructions on how to use jcal, please visit [nongnu.org](http://www.nongnu.org/jcal/jdate.html)
