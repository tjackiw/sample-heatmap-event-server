# Intro

This is a sample event server that can be used to store and generate heat maps from event data.

It uses *Sinatra* for the server, *MongoDB* as a data store, and my *[heatmap](https://github.com/tjackiw/heatmap)* gem to generate the heat maps.

## Prerequisite

You need to have *bundler* installed. 


## Using it

Clone this project:

```shell
$ git clone git@github.com:tjackiw/sample-heatmap-event-server.git
$ cd sample-heatmap-event-server
```

And install the dependencies:

```shell
$ bundle
```

## Server (*server.rb*)

The server is a simple *Sinatra* server that inserts event data to *MongoDB*. 

It needs to be running before the `client` can post sample event data:

```shell
$ ruby server.rb
```

## Client (*client.rb*)

The client is a simple tool to simulate clients posting event data to the `server`. You can set the number of events to be generated with the `EVENTS` variable.

```shell
$ ruby client.rb #500 events by default
	
$ EVENTS=1000 ruby client.rb #1000 events
```

## Heatmap (*heatmap.rb*)

Once the `client` inserts data into the `server`, a heat map can be generated. You can set the optional output file name with the variable `OUTPUT`.

```shell
$ ruby heatmap.rb
	
$ OUTPUT=example.png ruby heatmap.rb
```
