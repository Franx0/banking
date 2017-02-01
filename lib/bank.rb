Dir.glob('./lib/bank/**/*.rb').each do |file|
  require file
end
