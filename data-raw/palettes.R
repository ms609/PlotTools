cbPalette8 <- c(
  "black"         = "#000000",
  "honolulu blue" = "#2271B2",
  "summer sky"    = "#3DB7E9",
  "barbie pink"   = "#F748A5",
  "ocean green"   = "#359B73",
  "bamboo"        = "#d55e00",
  "gamboge"       = "#e69f00",
  "paris daisy"   = "#f0e442")

altPalette8 <- c( "#000000", "#AA0DB4", "#FF54ED", "#00B19F",
                  "#EB057A", "#F8071D", "#FF8D1A", "#9EFF37")

cbPalette12 <- c(
  "jazzberry jam" =     "#9F0162",
  "jeepers creepers" =  "#009F81",
  "barbie pink" =       "#FF5AAF",
  "aquamarine" =        "#00FCCF",

  "french violet" =     "#8400CD",
  "dodger blue" =       "#008DF9",
  "capri" =             "#00C2F9",
  "plum" =              "#FFB2FD",

  "carmine" =           "#A40122",
  "alizarin crimoson" = "#E20134",
  "outrageous orange" = "#FF6E3A",
  "bright spark" =      "#FFC33B")

altPalette12 <- c("#006A5E", "#ED0D88", "#00BDA9", "#FFC4D4",
                  "#0058CC", "#D208FB", "#FF66FD", "#00EFF9",
                  "#156D03", "#009719", "#00C61B", "#00FB1D")

cbPalette15 <- c(
  "tyrian purple"     = "#68023F",
  "deep sea"          = "#008169",
  "persian rose"      = "#EF0096",
  "aquamarine"        = "#00DCB5",
  "azalea"            = "#FFCFE2",

  "congress blue"     = "#003C86",
  "veronica"          = "#9400E6",
  "bleu de france"    = "#009FFA",
  "shocking pink"     = "#FF71FD",
  "electric blue"     = "#7CFFFA",

  "rosewood"          = "#6A0213",
  "india green"       = "#008607",
  "tractor red"       = "#F60239",
  "radioactive green" = "#00E307",
  "gargoyle gas"      = "#FFDC3D")

altPalette15 <- c( "#00463C", "#C00B6F", "#00A090", "#FF95BA", "#5FFFDE",
                   "#590A87", "#0063E5", "#ED0DFD", "#00C7F9", "#FFD5FD",
                   "#3D3C04", "#C80B2A", "#00A51C", "#FFA035", "#9BFF2D")

cbPalette24 <- c(
  "mulberry"            = "#5A0A33",
  "french plum"         = "#810D49",
  "jazzberry jam"       = "#AB0D61",
  "magenta"             = "#D80D7B",
  "persian rose"        = "#FF2E95",
  "barbie pink"         = "#FF78AD",
  "amaranth pink"       = "#FFACC6",
  "azalea"              = "#FFD7E1",

  "christalle"          = "#460B70",
  "purple heart"        = "#6B069F",
  "french violet"       = "#8E06CD",
  "electric purple"     = "#B40AFC",
  "psychadelic purple"  = "#ED0DFD",
  "fuschia"             = "#FF66FD",
  "violet"              = "#FFA3FC",
  "pale mauve"          = "#FFD5FD",

  "rosewood"            = "#5F0914",
  "hot chile"           = "#86081C",
  "alabama crimson"     = "#B20725",
  "amaranth red"        = "#DE0D2E",
  "carmine"             = "#FF4235",
  "burning orange"      = "#FF8735",
  "frenzee"             = "#FFB935",
  "gargoyle gas"        = "#FFE239")

altPalette24 <- c(
  "sherwood green"       = "#003D30",
  "deep opal"            = "#005745",
  "robin hood"           = "#00735C",
  "elf green"            = "#009175",
  "jeepers creepers"     = "#00AF8E",
  "aquamarine"           = "#00CBA7",
  "vivid opal"           = "#00EBC1",
  "light turquoise"      = "#86FFDE",

  "madison"              = "#00306F",
  "tory blue"            = "#00489E",
  "royal blue"           = "#005FCC",
  "azure"                = "#0079FA",
  "bleu de france"       = "#009FFA",
  "capri"                = "#00C2F9",
  "aqua blue"            = "#00E5F8",
  "electric blue"        = "#7CFFFA",

  "british racing green" = "#004002",
  "san felix"            = "#005A01",
  "bilbao"               = "#007702",
  "india green"          = "#009503",
  "kelly green"          = "#00B408",
  "vivid harlequin"      = "#00D302",
  "radioactive green"    = "#00F407",
  "lime"                 = "#AFFF2A")

usethis::use_data(
  cbPalette8, altPalette8,
  cbPalette12, altPalette12,
  cbPalette15, altPalette15,
  cbPalette24, altPalette24,
  overwrite = TRUE,
  compress = "gzip"
)
