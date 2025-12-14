library(shiny)
library(DT)
library(shinyWidgets)
#' 序列号查询生成器界面
#'
#' @param colTitles  主页标题
#' @param widthRates 左右比例
#' @param func_left 左函数
#' @param func_right 右函数
#' @param tabTitle 标题
#' @param func_bottom  下面一栏
#'
#' @return 返回值
#' @import tsui
#' @export
#'
#' @examples
#' SerialNumberUI()
SerialNumberUI <- function(tabTitle ='Serial Number',
                           colTitles =c('Filter Area','Operation Area','Result Area'),
                           widthRates =c(6,6,12),
                           func_left = SerialNumberUI_left,
                           func_right =SerialNumberUI_right,
                           func_bottom = SerialNumberUI_bottom
) {

  #三栏式设置，可以复制
  res = tsui::uiGen3(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right,func_bottom = func_bottom )
  return(res)

}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' SerialNumberUI_left()
SerialNumberUI_left <- function() {


  res <- tagList(
    tsui::mdl_text2(id ='text_SerialNumber' ,label ='Serial Number',value = ''),
    shiny::actionButton(inputId = 'btn_SerialNumber_view',label = 'Search'),
    tsui::mdl_download_button(id = 'dl_SerialNumber',label = 'Download')









  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' SerialNumberUI_bottom()
SerialNumberUI_right <- function() {
  res <- tagList(
    pickerInput(
      inputId = "SerialNumber_column_selector",
      label = "Selected Columns:",
      choices = NULL,  # 将在服务器端动态更新
      options = list(
        `actions-box` = TRUE,
        `selected-text-format` = "count > 3",
        `count-selected-text` = "{0} Columns Seleced",
        size = 10,
        `live-search` = TRUE,
        `live-search-style` = "contains"
      ),
      multiple = TRUE,
      choicesOpt = list(
        style = rep(("color: black;"), 100)
      )
    ),
    # 全选/取消全选按钮
    actionButton("btn_SerialNumber_select_all", "Select All",
                 class = "btn-primary btn-sm",
                 style = "margin-right: 5px;"),
    actionButton("btn_SerialNumber_deselect_all", "Deselect All",
                 class = "btn-secondary btn-sm"),
    actionButton("btn_SerialNumber_defaultValue", "Default Value",
                 class = "btn-primary btn-sm")






  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' SerialNumberUI_bottom()
SerialNumberUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'SerialNumber_resultView',label ='Result Show',lang='en' ))

  )
  return(res)

}
