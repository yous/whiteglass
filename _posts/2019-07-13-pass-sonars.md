# Pass Sonars
### A basic Python package to create pass sonars in Python

A while back I wrote a [post](https://totalfootballanalysis.com/data-analysis/data-analysis-france-south-korea-tactical-analysis-statistics) for [Total Football Analysis](https://totalfootballanalysis.com) about creating pass sonars in Python. Encouraged by how well that piece did, I decided to write a simple Python package called [PassSonars](https://github.com/AbhishekSharma99/PassSonars) which will allow people to create [pass sonars](https://twitter.com/etmckinley/status/1046389278153068545?lang=en) with greater ease. 

<img src="https://github.com/AbhishekSharma99/Statsbomb-Data/blob/master/gggg.PNG" width="800" />


## Dependencies

You'll need to have Python 3.x installed along with the following libraries - 

- Matplotlib
- Pandas
- Numpy

## Setting up PassSonars

In order to get PassSonars up and running, here's what you have to do -

* Clone [PassSonars](https://github.com/AbhishekSharma99/PassSonars) on your local computer. 

* Once that's done, all you have to do is edit a few paths in `Sonars.py`.

  Open `Sonars.py`
  
    * Change `base_link` to the full path of the events directory of the Statsbomb data

    * Change `image_link` to the full path of the  `.png` image of the Statsbomb logo from the Statsbomb data

    * Change `positions_json` to the full path of `PositionsStatsbomb.json` which you'll find in the cloned `PassSonars` folder. 

## Using PassSonars

Once the above steps are done, you're ready to use `PassSonars`! Here's how to do it.


1. Open a new `.py` *file within the `PassSonars` directory*. Alternatively, I've also added a `Test.py` file which you can edit and use to call PassSonars. 

2. Firstly, you import `matplotlib` to use the colormaps as well as using the `pyplot.show` function to see the results. 
Next you import PassSonars as follows - 
```
from Sonars import PlotSonars
```

3. Next, we'll create an instance of the `PlotSonars` class by doing so - 
```
inst = PlotSonars(mid, team_no, cmap)
```

  The three arguments are respectively-
    1. The Statsbomb match_id of the match for which you want to create the pass-sonars
    2. The team_no - either 0 or 1, depending on which of the two teams' sonar you want to see
    3. cmap (optional) - the [colormap](https://matplotlib.org/3.1.0/tutorials/colors/colormaps.html) for the sonars - default is viridis

4. Finally, you pass the instance to the Main function of the `PlotSonars` class and call `plt.show()`. Hopefully, you'll see your result being displayed. 

**All of the above is present in `Test.py`**

## Issues

As this is my first package, a lot going under the hood is less than desirable. I've tried my best to ensure the code is [PEP8](https://www.python.org/dev/peps/pep-0008) compliant. Another obvious thing to work upon is increasing the overall functionality available. If you wish to contribute in any way or have any other questions, feel free to open pull requests/issues. 
