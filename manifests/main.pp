if !$::website {
  fail('You must specify a website name!')
}

# Don't filebucket anything locally
File { 
  backup => false, 
}

$engine = hiera('engine')

include bertha
include $engine
