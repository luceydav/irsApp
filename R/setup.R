if ( file.exists(here::here("data/irs_app_big.fst"))) {
    data <-
      fst::read_fst(here::here("data/irs_app_big.fst"))
} else {
    data <- irsSOI::irs_app_data
}

# if ( file.exists("/Users/davidlucey/Desktop/David/Projects/irs_soi_app/data") ) {
#   data <-
#     fst::read_fst("/Users/davidlucey/Desktop/David/Projects/irs_soi_app/data/irs_app_big.fst")
# } else if ( file.exists("data") ) {
#   data <-
#     fst::read_fst("data/irs_app_big.fst")
# } else if ( file.exists("/data") ) {
#   data <-
#     fst::read_fst("/data/irs_app_big.fst")
# } else {
#   data <- irsSOI::irs_app_data
# }
# data <-
#   fst::read_fst("https://www.dropbox.com/s/4j3mo0ew9inr6fn/irs_app_big.fst?dl=0")
