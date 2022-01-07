# Download/install the latest version of jcal
<div align='center'>
<img alt='last-commit' src='https://img.shields.io/github/last-commit/davoudarsalani/action-jcal?&labelColor=black&color=grey&style=flat'>
<img alt='commit-activity' src='https://img.shields.io/github/commit-activity/m/davoudarsalani/action-jcal?&labelColor=black&color=grey&style=flat'>
</div>
<br>

Jalali Calendar, developed by Ashkan Ghassemi, is:
> ... a small and portable free software library to manipulate date and time in Jalali calendar system.
<br>

---
```yml
- name: Installing jcal
  uses: davoudarsalani/action-jcal@master
  with:
    source: 'docker'  ## default
```
There are eight options for `source` in order for jcal to be installed/used:
* Use docker image
  * `docker` will pull jcal docker image/repository (about 8.22MB in size) offering `jdate` installed on Alpine Linux
* Clone git repository
  * `clone-github` will clone from __github.com__
  * `clone-gnu` will clone from __gnu.org__
  * `clone-nongnu` will clone from __nongnu.org__
* Download tar.gz file
  * `askapache` will download from __askapache.com__ 
  * `gnu` will download from __gnu.org__
  * `nongnu` will download from __nongnu.org__
* Use python module
  * `jdatetime` will install jdatetime
<br>

If `docker` is set for source, you can use `jdate` command in two methods to get date/time:
```yml
- name: Getting date/time
  shell: bash
  run: |
      ## Method 1: no container
      date_time="$(docker run --rm -t davoudarsalani/jcal jdate '+%Y-%m-%d %H:%M:%S %A')"
      ## Method 2: creating a container
      docker run -d -t --name cnt davoudarsalani/jcal
      date_time="$(docker exec -t cnt jdate '+%Y-%m-%d %H:%M:%S %A')"
```
Similarly, if options such as `clone-github`, `clone-gnu`, `clone-nongnu`, `askapache`, `gnu` or `nongnu` are set, you can use `jdate` command:
```yml
run: date_time="$(jdate '+%Y-%m-%d %H:%M:%S %A')"
```
<br>

> Note: `jdate` and `date` share the same format.
<br>

Alternatively, for `jdatetime` as source, you may use the following command to set date/time:
```yml
run: date_time="$(python -c "import jdatetime; \
       print(jdatetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S %A'))")"
```

> Note: `jdatetime` option, as mentioned earlier, uses jdatetime python module whose [Documents](https://pypi.org/project/jdatetime/) states that we can use the same format used for the datetime module:
>> This module exactly follows Python Standard datetime module’s methods http://docs.python.org/release/2.7.1/library/datetime.html
<br>

---
* Jalali Calendar homepage: [gnu.org](https://www.gnu.org/savannah-checkouts/non-gnu/jcal/) and [nongnu.org](http://www.nongnu.org/jcal/) 
* To get more versions/tags of jcal docker image/repository, please visit [docker.com](https://hub.docker.com/repository/docker/davoudarsalani/jcal)
* To install jdatetime python module, please visit [pypi.org](https://pypi.org/project/jdatetime/)
* To clone jcal repository, please visit [github.com](https://github.com/ashkang/jcal), [gnu.org](http://git.savannah.gnu.org/cgit/jcal.git) or [nongnu.org](http://savannah.nongnu.org/git/?group=jcal)
* To download jcal in tar.gz, please visit [askapache.com](http://nongnu.askapache.com/jcal/), [gnu.org](http://download-mirror.savannah.gnu.org/releases/jcal/) or [nongnu.org](http://download.savannah.nongnu.org/releases/jcal/)
* For instructions on how to manually download and install jcal, please visit [wiki.ubuntu.ir](https://wiki.ubuntu.ir/wiki/Jcal) or [wiki.ubuntu.ir](https://wiki.ubuntu.ir/index.php?title=Jcal&oldid=1300)
* For instructions on how to use jcal/jdate, please visit [nongnu.org](http://www.nongnu.org/jcal/jdate.html) or [mankier.com](https://www.mankier.com/1/jdate)
