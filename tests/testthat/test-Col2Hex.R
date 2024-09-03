test_that("Col2Hex()", {
  expect_equal(Col2Hex(c("peachpuff", "blue"), TRUE),
               c("#FFDAB9FF", "#0000FFFF"))
  expect_equal(Col2Hex(c("#FFDAB9AA", "blue"), TRUE),
               c("#FFDAB9AA", "#0000FFFF"))
  expect_equal(Col2Hex(1:3),
               if (getRversion() >= "4.0.0") c("#000000", "#DF536B", "#61D04F")
               else c("#000000", "#FF0000", "#00CD00") # old colours
               )
})
