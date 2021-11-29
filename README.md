# GAUSS Westerlund tests
Econometric package containing the library of GAUSS codes of [Joakim Westerlund](https://sites.google.com/site/perjoakimwesterlund/).


## Getting Started
### Prerequisites
The program files require a working copy of **GAUSS 19+**. Many tests can be run on earlier versions with some small revisions and users should contact erica@aptech.com for a modified library for earlier **GAUSS** versions.

### Installing
**GAUSS 20+**
The GAUSS Westerlund library can be installed and updated directly in GAUSS using the [GAUSS package manager](https://www.aptech.com/blog/gauss-package-manager-basics/).

**GAUSS 18+**
The GAUSS Westerlund library can be easily installed using the [**GAUSS Application Installer**](https://www.aptech.com/support/installation/using-the-applications-installer-wizard/), as shown below:

1. Download the zipped folder `westerlundlib_0.1.zip` from the [westerlundlib release page](https://github.com/aptech/gauss-westerlund-library/releases/tag/v0.1.0).
2. Select **Tools > Install Application** from the main **GAUSS** menu.  
3. Follow the installer prompts, making sure to navigate to the downloaded `westerlund_0.1.zip`.
4. Before using the functions created by `westerlundlib` you will need to load the newly created `westerlundlib` library. This can be done in a number of ways:
  *   Navigate to the library tool view window and click the small wrench located next to the `westerlundlib` library. Select `Load Library`.  
  *  Enter `library westerlundlib` in the program input/output window.
  *  Put the line `library westerlundlib;` at the beginning of your program files.

>  Note: I have provided the individual files found in [`westerlundlib_1.0.zip`](https://github.com/aptech/gauss-westerlund-library/releases/tag/v0.1.0) for examination and review. However, installation should always be done using the [`westerlundlib_0.1.zip` folder from the release page](https://github.com/aptech/gauss-westerlund-library/releases/tag/v0.1.0) and the [**GAUSS Application Installer**](https://www.aptech.com/support/installation/using-the-applications-installer-wizard/).

### Examples
After installing the library the example files will be found in your **GAUSS** home directory in the directory **pkgs > westerlundlib >examples**. The example uses **GAUSS** datasets included in the **pkgs > westerlundlib >examples** directory.

### Documentation
We have not yet developed detailed documentation about the library. However, you can find more information about the functions by looking at the function headers in the `.src` codes.

You can access these source codes through the library tool by expanding the `westerlundlib.lcg` menu and clicking on the file name. The file will open in the program editor and you will be able to view the headers for each specific function.

## License
The author makes no performance guarantees. The `westerlundlib` is available for public non-commercial use only.

## Author
For any bugs, please send e-mail to [Erica Clower](mailto:erica@aptech.com).

## Supported
|src file| Reference|Description|Procedure|
|:------:|:---------|:------------|:---------|
|cusum_west.src|[Westerlund, J. (2005)](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1468-0084.2004.00118.x). A Panel CUSUM Test of the Null of Cointegration. *Oxford Bulletin of Economics and Statistics*, **67**, 231-262|Panel data cointegration test|`cusum_panel`, `cusum_west`|
|ll.src|[Westerlund, J. (2005)](https://onlinelibrary.wiley.com/doi/10.1111/j.1468-0084.2005.00137.x). Data Dependent Endogeneity Correction in Cointegrated Panels. *Economics Letters*, **67**, 691-705|Panel data cointegration test|`estsys`, `icsys`|
|lm| [Westerlund, J. (2006)](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1468-0084.2006.00154.x)  Testing for Panel Cointegration with Multiple Structural Breaks. *Oxford Bulletin of Economics and Statistics*, **68**, 101-132.|Panel data cointegration with multiple structural breaks|`lmbreak`, `lmbreak_panel`|
|brei.src|[Westerlund, J. (2006)](https://www.tandfonline.com/doi/abs/10.1080/07474930500243019). New Simple Tests for Panel Cointegration. *Econometric Reviews*, **24**, 297-316.|Panel data cointegration test|`brei_panel`|
|adfmin.src| [Westerlund, J. (2006)](https://www.sciencedirect.com/science/article/abs/pii/S016517650500354X). Testing for Panel Cointegration with a Level Break.  *Economic Letters*, **91**, 27-33.| Panel data cointegration tests with level break.|`adfmin_west`|
|ecm_boot.src|[Westerlund, J. (2007)](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1468-0084.2007.00477.x). Testing for Error Correction in Panel Data. *Oxford Bulletin of Economics and Statistics* **69**, 709-748|Panel data error correction model.|`ecm_panel`, `pecm`|
|lmcoint.src| [Westerlund, J. and Edgerton, D.L. (2007)](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1467-9892.2006.00504.x). New Improved Tests for Cointegration with Structural Breaks. *Journal of Time Series Analysis* **28**, 188-224.|Cointegration test with structural breaks|`lm_break`, `ilt_lmcoint`|
|baikao.src| Westerlund, J. (2007). Unbiased Estimation of Cointegrated Panel Regressions with Cross Section Dependence. *Journal of Financial Econometrics*, **5**, 491-522. |Panel cointegration with cross section dependence.|`tset`, `itest`|
|cointboot.src|[Westerlund, J. and Edgerton, D.L. (2007)](https://www.sciencedirect.com/science/article/abs/pii/S0165176507000900). A Panel Bootstrap Cointegration Test. *Economics Letters*, **97**, 185-190.|Bootstrap panel cointegration.|`boot_panel`, `boot`|
|durbinh.src|[Westerlund, J. (2008)](https://onlinelibrary.wiley.com/doi/full/10.1002/jae.967). Panel Cointegration Tests of the Fisher Hypothesis. *Journal of Applied Econometrics* **23**, 193-233.|Panel data cointegration.|`gdh_panel`, `gdh`|
|panellmcoint.src|[Westerlund, J. and Edgerton, D.L. (2008)](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1468-0084.2008.00513.x). Simple Tests for Cointegration in Dependent Panels with Structural Breaks. *Oxford Bulletin of Economics and Statistics* **70**, 665-704.|Panel data cointegration with structural breaks|`ilt_br`, `ilt_fact`|




[Aptech Systems, Inc](https://www.aptech.com/)  
[![alt text][1.1]][1]
[![alt text][2.1]][2]
[![alt text][3.1]][3]

<!-- links to social media icons -->
[1.1]: https://www.aptech.com/wp-content/uploads/2019/02/fb.png (Visit Aptech Facebook)
[2.1]: https://www.aptech.com/wp-content/uploads/2019/02/gh.png (Aptech Github)
[3.1]: https://www.aptech.com/wp-content/uploads/2019/02/li.png (Find us on LinkedIn)

<!-- links to your social media accounts -->
[1]: https://www.facebook.com/GAUSSAptech/
[2]: https://github.com/aptech
[3]: https://linkedin.com/in/ericaclower
<!-- Please don't remove this: Grab your social icons from https://github.com/carlsednaoui/gitsocial -->
