x <- c(1:4, 3)
monotone::monotone(x)
.C( "isoreg_dp", n = as.integer( length(x) ), x = as.double( x ), w = as.double( rep(1, length(x)) ), PACKAGE = "monotone" )

