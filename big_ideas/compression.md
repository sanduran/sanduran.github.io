[home](https://sanduran.github.io) | [projects](https://sanduran.github.io/projects) | [big ideas](https://sanduran.github.io/big_ideas) | [documentation](https://sanduran.github.io/documentation)

# BIG IDEAS
### Data Compression
Compression is the process of reducing the size of data by encoding it efficiently without losing essential information.
##### Lossless Compression  
Lossles compression is compressing a file in a way that will not get any information lost. You have the be able to recreate the original perfectly from the compressed file, without any losses.
##### Lossy Compression
However in lossy compression, some information may be lost in order to make the file smaller.

To see how different file types compress data, I converted a PNG image to JPEG and ZIP files.  
| Format        | File Size(KB) | Visible Changes                     |  
|:-------------:|--------------:|------------------------------------:|
| PNG(original) | 8254.122      | original                            |
| JPEG(lossy)   | 789.283       | close to none(slightly more blurry) |
| ZIP(lossless) | 8257.359      | none                                |

The JPEG file was surprisingly high quality while also being much smaller in size. This is because JPEG was made to make digital images easier to store, send, and display when computers and the interned had little memmory and speed.

*Original PNG file (Kingdom COme Deliverance II Wallpaper)*
![OriginalPNG](https://sanduran.github.io/assets/compression/KCDWallpaper.png)

*Compressed JPEG file*
![CompressedJPG](https://sanduran.github.io/assets/compression/KCDWallpaper.jpg)

Interestingly, the ZIP file was bigger than the original file. This is because PNG files use a similar compression method to ZIP files and compressing a file with the same algorithm twice doesn't work. Instead ZIP files are better at compressing raw text documents so I compressed the entire bee movie script to test it.  
| Format | File Size(KB) |
|:---:|---:|
| Text(original) | 49.474 |
| ZIP(lossless) | 21.126 |

As expected when compressing a text document, ZIP did way better compared to compressing the PNG file.
