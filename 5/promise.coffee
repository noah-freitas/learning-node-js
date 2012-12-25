test_and_load = (filename) ->
  promise = new process.Promise

  fs.stat(filename)
    .addCallback (stat) ->
      # Filter out non-files
      if not stat.isFile()
        promise.emitSuccess()
        return

      # Otherwise read the file in
      fs.readFile(filename)
        .addCallback (data) ->
          promise.emitSuccess data
        .addErrback (error) ->
          promise.emitError error

    .addErrback (error) -> promise.emitError error

  promise
