# Download and install the latest version of jcal

#### You can set the `source` to four sources for jcal to be downloaded from:
* `clone-github` and `clone-gnu` will clone the git repository from github.com and gnu.org respectively
* `gnu` and `askapache` will download the tar.gz file from gnu.org and askapache.com respectively

```yml
- name: Install Jcal
  uses: davoudarsalani/action-jcal@master
  with:
    source:        ## default: 'clone-github' (options: 'clone-github'/'clone-gnu'/'gnu'/'askapache')
    set_timezone:  ## default: true
    timezone:      ## default: 'Asia/Tehran'
```
<br>

* Jalali Calendar [main page](http://www.nongnu.org/jcal/)
* To clone jcal repository, please visit [github](https://github.com/ashkang/jcal) or [gnu](http://git.savannah.gnu.org/cgit/jcal.git)
* To download jcal in tar.gz, please visit [gnu](http://download-mirror.savannah.gnu.org/releases/jcal/) or [askapache](http://nongnu.askapache.com/jcal/)
* For instructions on how to manually download and install jcal, please visit [wiki.ubuntu.ir](https://wiki.ubuntu.ir/wiki/Jcal) or [wiki.ubuntu.ir](https://wiki.ubuntu.ir/index.php?title=Jcal&oldid=1300)
* For instructions on how to use jcal, please visit [nongnu.org](http://www.nongnu.org/jcal/jdate.html)
