# ToTheMoon
Hi! This is team To The Moon. For this project, we are aiming to create a stock market interface using processing to enable users to analyze stocks using different indicators and tools. Our project will be modeled off of the platform TradingView, a popular financial charts analyzer for traders. The interface will gather data from the Alpha Vantage API to construct an initial graph of candlesticks for a user entered stock. We will also implement popular indicators like Fibonacci retracement, Bollinger bands, Elliot waves, and more! Users will be able to display the indicators and draw their own support and resistance lines, and trends to help them predict price movement. Our ultimate goal is to create an aesthetically pleasing and easy-to-use interface to examine a stock using technical analysis.

Link to Prototype: https://docs.google.com/document/d/1pQFxh666HGTi9fJxpToamVlzwXdhTgp3B7jWdYR1Qh4/edit?usp=sharing


Run instructions: 

	When the program first opens, it will present you with a menu of different stocks. Type in the ticker symbol for one of these stocks, and our program will open up the corresponding graph. If you make a typo, press backspace and retype the ticker symbol. If you accidentally press enter after a typo, it will reset you.
	
	The default mode is the pointer mode. In this mode, you can drag the screen up, down, left, and right to look at different points in the stock’s history. The x and y coordinates will be displayed, and will change accordingly to your screen movements. There will be multiple buttons to the left side of the screen. Each of these buttons corresponds to a certain tool, such as marker and trendline. Clicking on one of these buttons will change the mode to the corresponding mode. You can revert back to the pointer mode by pressing the button a second time. 

  *Note: you can not switch directly between two tools. If you are in marker mode and you want to use the bollinger bound tool, you need to first click on the marker button to turn it off then click on the bollinger bound button to turn it on. 
  
  WHAT EACH OF THE TOOLS DO: 
  
    1) Marker: Press and drag the mouse around to make marker 
    2) Trendline: Click once to plot your first point, then move your mouse and click again to plot the second point and draw the line between them
    3) Text: Type in your desired text, click enter, then click on the screen at the location where you want the text to appear
    4) SMA: Simply click on the button once to display the simple moving average line
    5) Fib Retracement: This is similar to trendline; you are plotting two points. 
    6) Bollinger Bound: click the button once and drag your mouse around a little to display the bollinger bounds. 


Dev Log

5/23

Taee - Watched youtube videos with Samin on github branching and merging and explored the resources provided by Mr.K.

Samin - Watched youtube videos with Taee on github branching and merging and explored the resources provided by Mr.K.

5/24

Taee - Created a demo branch with Samin and practiced creating branches, dealing with merge conflicts, and understanding the github network feature.

Samin - Created a demo branch with Taee and practiced creating branches, dealing with merge conflicts, and understanding the github network feature.

5/25

Taee - Created setup, candle, and tool classes. Developed a primitive system for determining which button/mode is pressed

Samin - Worked with Taee in class and on his computer on setting up base code.

5/26

Taee - Conducted research on reading in stock data from online sources. Chose Tesla as our reference stock for development.

Samin - Fixed y coordinate for candles and problem with candle color.

5/27

Taee - Assisted Samin in class with developing the candles.

Samin - Finished candle stick class and successfully displayed candles with different colors and lengths corresponding to data.

5/28

Taee - Reworked the structure for tools, completed the algorithm for marker class, looked for a way to link it with the main class. 

Samin - Used data from yahoo and made method to parse csv data and make a graph of candle sticks.

5/29

Taee - Created an interactive button to allow users to draw anywhere on screen and switch between modes.

Samin - Implemented feature to make graph and candlesticks move with user mouse drag.

5/30

Taee - Found a new approach for implementing the trendline and successfully created the tool.

Samin - Created y-axis for graph that adjusts to user mouse drag and added ticker symbol and for stock displayed.

5/31

Taee - Helped Samin start textbox tool and researched user text input in processing.

Samin - Started new textbox tool and was able to create new button and ability to insert placeholder text anywhere on screen.

6/1

Taee - Implemented a demo for zooming in/out & panning left/right.

Samin - Finished textbox tool and changed color scheme of graph and candles.

6/2

Taee - Conducted research on creating eraser/delete tools.

Samin - Conducted research on creating eraser/delete tools.

6/6

Taee - Attempted to implement the zooming in/out feature, ran into several problems.

Samin - Changed the program layout, added grid lines, updated axis.

6/7

Taee - Fixed the trendline bug by increasing press area for a button

Samin - Made the axis dissapear at certain point on screen


6/9

Taee - Started developing simple moving average tool

Samin - Helped Taee start developing new SMA tool


6/11

Taee - Implemented bollinger bounds using standard deviation calculations

Samin - Implemented bollinger bounds using standard deviation calculations

6/12

Taee - Fixed all bugs, worked on layout, final touches

Samin - Implemented the starting menu 
