In Fish 
```
diff (ls | psub) (ls -al | psub)
```
In bash
```
diff <(ls) <(ls -al)
```
**Process substitution** is a feature in Unix-like shells that allows you to treat the output of a command as if it were a physical file sitting on your hard drive.

It is a clever bit of plumbing that tricks programs into accepting live, running data streams when they are strictly expecting a static file path.

For example 
```
nvim <(curl linkoftextfile.txt)
```
instead of Downloading and then editing the file 
it makes easier direct edit in new file where the content copied from the curl output 