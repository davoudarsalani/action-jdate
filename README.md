# Download/install the latest version of jcal
<div align='center'>
<img alt='last-commit' src='https://img.shields.io/github/last-commit/davoudarsalani/action-jcal?&labelColor=black&color=grey&style=flat'>
<img alt='commit-activity' src='https://img.shields.io/github/commit-activity/m/davoudarsalani/action-jcal?&labelColor=black&color=grey&style=flat'>
</div>
<br>

#### There are five options for `source` in order for jcal to be downloaded/used:
* `docker` will pull [this](https://hub.docker.com/repository/docker/davoudarsalani/jcal) docker image/repository (about 69MB in size) in which [jdatetime](https://pypi.org/project/jdatetime/) python module is installed on Alpine Linux
* `clone-github` will clone the git repository from __github.com__
* `clone-gnu` will clone the git repository from __gnu.org__
* `askapache` will download the tar.gz file from __askapache.com__ 
* `gnu` will download the tar.gz file from __gnu.org__

```yml
- name: Installing jcal
  uses: davoudarsalani/action-jcal@master
  with:
    source:  ## default: 'docker'
             ## (options: 'docker'/'jdatetime'/'clone-github'/'clone-gnu'/'askapache'/'gnu')
```
If `docker` is set for source, you can use jdatetime in the next steps/jobs in two methods:
```yml
- name: Getting date/time
  shell: bash
  run: |
      ## Method 1: no container
      date_time="$(docker run --rm davoudarsalani/jcal \
        python -c "import jdatetime; \
        print(jdatetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S %A'))")"
      ## Method 2: creating a container
      docker run -d -t --name cnt davoudarsalani/jcal
      date_time="$(docker exec -t cnt python -c "import jdatetime; \
        print(jdatetime.datetime.now().strftime('%Y %m %d %H %M %S %A'))")"
```
Alternatively, for `jdatetime` as source, you use the following command to set date/time:
```yml
run: date_time="$(python -c "import jdatetime; \
       print(jdatetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S %A'))")"
```
However, if any other choice is set for source, you can use `jdate` command to get date/time exectly the same as `date` since they share the same format:
```yml
run: date_time="$(jdate '+%Y-%m-%d %H:%M:%S %A')"
```
<br>


* Jalali Calendar [main page](http://www.nongnu.org/jcal/)
* To get more versions/tags of jcal docker image/repository, please visit [docker.com](https://hub.docker.com/repository/docker/davoudarsalani/jcal)
* To install jdatetime python module, please visit [pypi.org](https://pypi.org/project/jdatetime/)
* To clone jcal repository, please visit [github.com](https://github.com/ashkang/jcal) or [gnu.org](http://git.savannah.gnu.org/cgit/jcal.git)
* To download jcal in tar.gz, please visit [gnu.org](http://download-mirror.savannah.gnu.org/releases/jcal/) or [askapache.com](http://nongnu.askapache.com/jcal/)
* For instructions on how to manually download and install jcal, please visit [wiki.ubuntu.ir](https://wiki.ubuntu.ir/wiki/Jcal) or [wiki.ubuntu.ir](https://wiki.ubuntu.ir/index.php?title=Jcal&oldid=1300)
* For instructions on how to use jcal/jdate, please visit [nongnu.org](http://www.nongnu.org/jcal/jdate.html)
