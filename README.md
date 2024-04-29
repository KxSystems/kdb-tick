# kdb Architecture

This repo contains sample kdb architecture for building a kdb application for capturing real time streaming data. This repo accompanies the online training course on the KX Academy.

# Quickstart
```
q tick.q sym . -p 5010 
q tick/rdb.q -p 5011 
q tick/feed.q
q tick/hdb.q sym -p 5012 
q tick/rts.q -p 5013 
q tick/gw.q -p 5014 
```