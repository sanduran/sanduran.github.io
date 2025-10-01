[home](https://sanduran.github.io) | [projects](https://sanduran.github.io/projects) | [big ideas](https://sanduran.github.io/big_ideas) | [documentation](https://sanduran.github.io/documentation)

# BIG IDEAS
### Data Compression
Compression is the process of reducing the size of data by encoding it efficiently without losing essential information.
##### Lossless Compression  
Lossles compression is compressing a file in a way that will not get any information lost. You have the be able to recreate the original perfectly from the compressed file, without any losses.
##### Lossy Compression
However in lossy compression, some information may be lost in order to make the file smaller. Although lossy compression sounds worse than lossless compression it can be extremely useful when file size is more important.

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

##### Video Compression
Original file size: 22.2 MB  
| Compression Method | File Size(MB) | % Reduction | Quality Loss |
| --- | ---: | ---: | --- |
| H.264 60% target size | 12.6 | 43% | blurry |
| H.264 worst file quality | 5.1 | 77% | extremely pixelated |
| Clideo basic | 18.3 | 18% | slightly pixelated on the edges |
| Clideo strong | 13.6 | 39% | slightly blurry and pixelated on the edges |

Between these methods the first one strikes the balance between quality and balance best. It doesn't look very different from the original but is almost half the size. In cases like this lossy compression is acceptible because it doesnt affect the final result very much and still conveys the same essential information. However if lossy compression loses essential information, it is not acceptable.
