# DOCKER FOR PROYECTO APP

## Proyecto Final docker runner (ad)

The docker runner is a series of scripts that work directly over proyecto final docker. They are under `scripts/commands` 
folder, and are designed to provide a better environment experience. Feel free to provide your own command if you
think that it's gonna help others!

Add `scripts/` directory to you environment variable `$PATH` to allow execution of `ad` runner. Then use the runner
to install bash completions. In Ubuntu edit your `~/.profile` file and add at end something like:

```bash
PATH="$HOME/dev/proyecto/docker/scripts/:$PATH"
```

```bash
## Until you do a logout/login you will need to manually load the new path
$ source ~/.profile

## Install bash completions
$ ad install-bash-completions

# Running the runner without arguments
$ ad

Usage:

     ad command  

  Available commands:

     bash                        Executes a bash instance in container name 
     commander                   Enter bash showing the commander 
     frontend-start              Starts all containers with docker-compose 
     install-bash-completions    Install bash completions for ad 
     queues                      Run queues 
     start                       Starts all containers with docker-compose 
     stop                        Stops all containers with docker-compose 
     tail                        Tail the error log 


```

- - - -
