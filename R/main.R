suppressPackageStartupMessages(library(tidyquant))
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(lubridate))

## Data to download
#S&P 500
#tickers <- c("AAPL", "MSFT", "AMZN", "TSLA", "FB", "GOOGL", "GOOG", "BRK-B", "JPM", "JNJ", "V", "PG", "UNH", "NVDA", "DIS", "HD", "MA", "PYPL", "BAC", "INTC", "VZ", "CMCSA", "ADBE", "NFLX", "XOM", "T", "MRK", "PFE", "WMT", "CRM", "ABBV", "TMO", "PEP", "ABT", "CSCO", "KO", "CVX", "AVGO", "QCOM", "NKE", "NEE", "ACN", "COST", "MDT", "TXN", "MCD", "DHR", "BMY", "LLY", "HON", "UNP", "C", "WFC", "AMGN", "LIN", "PM", "LOW", "SBUX", "UPS", "ORCL", "IBM", "BA", "MS", "AMD", "RTX", "CAT", "GS", "BLK", "GE", "NOW", "TGT", "CVS", "AMAT", "INTU", "MMM", "AMT", "DE", "ISRG", "CHTR", "MU", "BKNG", "SCHW", "LMT", "MDLZ", "TJX", "AXP", "LRCX", "ANTM", "FIS", "CI", "SYK", "GILD", "ZTS", "MO", "BDX", "SPGI", "TMUS", "TFC", "CSX", "PLD", "CB", "CL", "CME", "ATVI", "ADP", "PNC", "ADSK", "USB", "DUK", "CCI", "GM", "ICE", "NSC", "APD", "SO", "FISV", "FDX", "EQIX", "DD", "ITW", "ADI", "VRTX", "SHW", "GPN", "D", "MMC", "EL", "PGR", "EW", "REGN", "ILMN", "HUM", "ECL", "COF", "DG", "BSX", "COP", "NEM", "EMR", "ETN", "AON", "NOC", "KLAC", "FCX", "KMB", "WM", "HCA", "DOW", "MCO", "BIIB", "TEL", "CTSH", "ROP", "IDXX", "ROST", "EXC", "BAX", "EA", "LHX", "APH", "MCHP", "ALGN", "F", "CMG", "MET", "SNPS", "AEP", "APTV", "A", "SYY", "JCI", "STZ", "BK", "CDNS", "CNC", "PH", "DLR", "TWTR", "EOG", "TT", "EBAY", "SLB", "IQV", "TRV", "TROW", "PPG", "GD", "CMI", "AIG", "WBA", "SRE", "HPQ", "XLNX", "MAR", "ALXN", "ORLY", "GIS", "MSCI", "DXCM", "MNST", "ZBH", "PSA", "XEL", "CARR", "PRU", "ALL", "TDG", "CTVA", "YUM", "PSX", "ANSS", "VRSK", "INFO", "SPG", "HLT", "PCAR", "RMD", "ES", "AFL", "ROK", "KMI", "DFS", "MPC", "BLL", "ADM", "MSI", "MCK", "SBAC", "PEG", "GLW", "AZO", "FAST", "LUV", "CTAS", "MTD", "AWK", "PAYX", "STT", "AME", "SWK", "WMB", "FRC", "WEC", "VFC", "KEYS", "PXD", "WELL", "WLTW", "DAL", "OTIS", "BBY", "SWKS", "ENPH", "ETSY", "VIAC", "DLTR", "MXIM", "KR", "LYB", "CLX", "CERN", "VLO", "AMP", "WY", "CPRT", "SIVB", "FTV", "DTE", "ED", "EIX", "FITB", "TER", "DHI", "MKC", "TTWO", "AVB", "FLT", "AJG", "WST", "ZBRA", "HSY", "PPL", "EFX", "LH", "VMC", "SYF", "CHD", "QRVO", "CBRE", "VTRS", "KHC", "NTRS", "EQR", "LEN", "ARE", "OXY", "O", "PAYC", "ODFL", "OKE", "KSU", "FTNT", "RSG", "HOLX", "VRSN", "IP", "EXPE", "MKTX", "ALB", "CDW", "HAL", "MTB", "TSN", "XYL", "CTLT", "MLM", "ETR", "URI", "HIG", "KEY", "COO", "DOV", "AEE", "LVS", "AES", "TSCO", "VTR", "TFX", "GRMN", "RF", "AMCR", "BR", "CFG", "KMX", "HES", "GWW", "IR", "INCY", "NUE", "ANET", "ULTA", "FE", "TYL", "DGX", "AKAM", "CAG", "PKI", "CMS", "NDAQ", "WAT", "CAH", "CTXS", "STE", "CE", "PEAK", "HPE", "DRI", "VAR", "EXPD", "BKR", "FMC", "CCL", "ABC", "ESS", "WDC", "HBAN", "GPC", "IEX", "K", "WAB", "MAS", "MAA", "POOL", "DPZ", "NTAP", "IT", "J", "EMN", "ABMD", "DRE", "TDY", "EXR", "LDOS", "RCL", "CINF", "NVR", "PFG", "OMC", "PKG", "UAL", "AVY", "BF-B", "STX", "BXP", "CHRW", "XRAY", "SJM", "IFF", "BIO", "JBHT", "HAS", "RJF", "MGM", "FBHS", "HRL", "WRK", "EVRG", "WHR", "NLOK", "LNT", "DVN", "FFIV", "JKHY", "TXT", "AAP", "LW", "UDR", "PHM", "CNP", "LUMN", "HWM", "L", "ATO", "LKQ", "PWR", "ALLE", "HST", "WYNN", "FOXA", "LB", "LYV", "HSIC", "UHS", "CBOE", "TAP", "AAL", "MOS", "NRG", "FANG", "PNR", "IPG", "CF", "BWA", "DISCK", "LNC", "TPR", "RE", "GL", "WRB", "CPB", "SNA", "NWL", "CMA", "MHK", "WU", "DVA", "IPGP", "IRM", "PNW", "NI", "ZION", "NCLH", "DISH", "ROL", "AIZ", "JNPR", "NLSN", "AOS", "COG", "IVZ", "RHI", "REG", "BEN", "DXC", "NWSA", "PVH", "FLIR", "KIM", "HII", "APA", "SEE", "ALK", "MRO", "PBCT", "PRGO", "NOV", "FRT", "DISCA", "VNO", "LEG", "HBI", "RL", "FTI", "UNM", "FLS", "VNT", "FOX", "SLG", "GPS", "HFC", "XRX", "UAA", "UA", "NWS")

#Nasdaq100
tickers <- c("AAPL", "MSFT", "AMZN", "TSLA", "FB", "GOOG", "GOOGL", "NVDA", "PYPL", "INTC", "CMCSA", "ADBE", "NFLX", "PEP", "CSCO", "AVGO", "QCOM", "COST", "TXN", "TMUS", "AMGN", "CHTR", "SBUX", "AMD", "AMAT", "INTU", "ISRG", "MELI", "MU", "BKNG", "MDLZ", "LRCX", "GILD", "JD", "ZM", "FISV", "CSX", "ATVI", "ADP", "BIDU", "ADSK", "ADI", "VRTX", "REGN", "ILMN", "MRNA", "NXPI", "PDD", "MNST", "KLAC", "DOCU", "KDP", "ALGN", "LULU", "BIIB", "CTSH", "WBA", "PTON", "MAR", "IDXX", "ROST", "EXC", "ASML", "WDAY", "EA", "MCHP", "MTCH", "KHC", "SNPS", "AEP", "EBAY", "CDNS", "MRVL", "XLNX", "NTES", "ALXN", "CTAS", "ORLY", "DXCM", "XEL", "SGEN", "ANSS", "PAYX", "VRSK", "OKTA", "PCAR", "TEAM", "FAST", "CPRT", "SPLK", "SWKS", "DLTR", "MXIM", "SIRI", "CERN", "VRSN", "INCY", "CDW", "CHKP", "TCOM", "FOXA", "FOX")

st_date <- "2020-01-01"
end_date <- as.character(Sys.Date())

## ====== Download data
cat("Downloading data... ")
prices <- tq_get(tickers, from = st_date, to = end_date, get = "stock.prices")
pricesDF <- as.data.frame(prices)
cat("\n")

# Get date list and relevant dates for price difference (5d, 10d, 20d, 50d, 100d, 200d)
date_list <- pricesDF[pricesDF$symbol == pricesDF[1, "symbol"], ]$date
calc_dates <- rep(as.Date(st_date), 7)

calc_dates[1] <- date_list[length(date_list)]
calc_dates[2] <- date_list[length(date_list) - 5]
calc_dates[3] <- date_list[length(date_list) - 10]
calc_dates[4] <- date_list[length(date_list) - 20]
calc_dates[5] <- date_list[length(date_list) - 50]
calc_dates[6] <- date_list[length(date_list) - 100]
calc_dates[7] <- date_list[length(date_list) - 200]

names(calc_dates) <- c("latest", "5d-ago", "10d-ago", "20d-ago", "50d-ago", "100d-ago", "200d-ago")


# Build data frame
# Structure:
# ticker, price, 5d%, 10d%, 20d%, 50d%, 100d%, 200d%
changeDF <- pricesDF[pricesDF$date == calc_dates["latest"], c("symbol", "close")]

changeDF$price_5d <- pricesDF[(pricesDF$date == calc_dates["5d-ago"]), "close"]
changeDF$price_10d <- pricesDF[(pricesDF$date == calc_dates["10d-ago"]), "close"]
changeDF$price_20d <- pricesDF[(pricesDF$date == calc_dates["20d-ago"]), "close"]
changeDF$price_50d <- pricesDF[(pricesDF$date == calc_dates["50d-ago"]), "close"]
changeDF$price_100d <- pricesDF[(pricesDF$date == calc_dates["100d-ago"]), "close"]
changeDF$price_200d <- pricesDF[(pricesDF$date == calc_dates["200d-ago"]), "close"]

changeDF$pct_5d <- 100 * ((changeDF$close - changeDF$price_5d) / changeDF$price_5d)
changeDF$pct_10d <- 100 * ((changeDF$close - changeDF$price_10d) / changeDF$price_10d)
changeDF$pct_20d <- 100 * ((changeDF$close - changeDF$price_20d) / changeDF$price_20d)
changeDF$pct_50d <- 100 * ((changeDF$close - changeDF$price_50d) / changeDF$price_50d)
changeDF$pct_100d <- 100 * ((changeDF$close - changeDF$price_100d) / changeDF$price_100d)
changeDF$pct_200d <- 100 * ((changeDF$close - changeDF$price_200d) / changeDF$price_200d)


