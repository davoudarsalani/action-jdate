# Download/install the latest version of jdate
<div align='center'>
<img alt='last-commit' src='https://img.shields.io/github/last-commit/davoudarsalani/action-jdate?&labelColor=black&color=grey&style=flat'>
<img alt='commit-activity' src='https://img.shields.io/github/commit-activity/m/davoudarsalani/action-jdate?&labelColor=black&color=grey&style=flat'>
</div>
<br>

Jalali Calendar, developed by Ashkan Ghassemi, is:
> ... a small and portable free software library to manipulate date and time in Jalali calendar system.
<br>

---
```yml
- name: Installing jdate
  uses: davoudarsalani/action-jdate@master
  with:
    source: 'docker-jdate'  ## default
```
There are eight options for `source` in order for jdate to be downloaded/used:
* Use docker image
  * `docker-jdatetime` will pull jdatetime docker image/repository (about 59MB in size) offering jdatetime python module on Alpine Linux
  * `docker-jdate` will pull jdate docker image/repository (about 8.22MB in size) offering `jdate` on Alpine Linux
* Clone git repository
  * `clone-github` will clone from __github.com__
  * `clone-gnu` will clone from __gnu.org__
  * `clone-nongnu` will clone from __nongnu.org__
* Download tar.gz file
  * `askapache` will download from __askapache.com__ 
  * `gnu` will download from __gnu.org__
  * `nongnu` will download from __nongnu.org__
<br>

For `docker-jdatetime` set as source, you may use the following command to set date/time:
```yml
run: date_time="$(docker run --rm -t davoudarsalani/jdatetime python -c "import jdatetime; print(jdatetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S %A'))")"
```
> Note: `docker-jdatetime` option, as mentioned earlier, uses jdatetime python module whose [Documents](https://pypi.org/project/jdatetime/) states that we can use the same format used for the datetime module:
>> This module exactly follows Python Standard datetime module’s methods http://docs.python.org/release/2.7.1/library/datetime.html
<br>

Alternatively, if `docker-jdate` is set for source, you can use `jdate` command to get date/time:
```yml
- name: Getting date/time
  shell: bash
  run: date_time="$(docker run --rm -t davoudarsalani/jdate jdate '+%Y-%m-%d %H:%M:%S %A')"
```
Similarly, if other options are chosen, you can use `jdate` command:
```yml
run: date_time="$(jdate '+%Y-%m-%d %H:%M:%S %A')"
```
<br>

> Note: `jdate` and `date` share the same format.
<br>

---
* Jalali Calendar homepage: [gnu.org](https://www.gnu.org/savannah-checkouts/non-gnu/jcal/) and [nongnu.org](http://www.nongnu.org/jcal/) 
* To get more versions/tags of jdate docker image/repository, please visit [docker.com](https://hub.docker.com/u/davoudarsalani)
* To install jdatetime python module, please visit [pypi.org](https://pypi.org/project/jdatetime/)
* To clone jcal repository, please visit [github.com](https://github.com/ashkang/jcal), [gnu.org](http://git.savannah.gnu.org/cgit/jcal.git) or [nongnu.org](http://savannah.nongnu.org/git/?group=jcal)
* To download jcal in tar.gz, please visit [askapache.com](http://nongnu.askapache.com/jcal/), [gnu.org](http://download-mirror.savannah.gnu.org/releases/jcal/) or [nongnu.org](http://download.savannah.nongnu.org/releases/jcal/)
* For instructions on how to manually download and install jcal/jdate, please visit [wiki.ubuntu.ir](https://wiki.ubuntu.ir/wiki/Jcal) or [wiki.ubuntu.ir](https://wiki.ubuntu.ir/index.php?title=Jcal&oldid=1300)
* For instructions on how to use jcal/jdate, please visit [nongnu.org](http://www.nongnu.org/jcal/jdate.html) or [mankier.com](https://www.mankier.com/1/jdate)
