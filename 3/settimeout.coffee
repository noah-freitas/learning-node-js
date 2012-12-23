# timer to open file and read contents to HTTP response object
openAndReadFile (filename, res) ->
  console.log 'opening ' + filename

  # open and read in file contents
  fs.readFile filename, 'utf8', (err, data) ->
    if err
      res.write'Could not find or open file for reading\n'
    else
      res.write data
  # reponse is done
  res.end()

setTimeout openAndReadFile, 2000, filename, res
