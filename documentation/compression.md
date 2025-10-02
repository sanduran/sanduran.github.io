[home](https://sanduran.github.io) | [projects](https://sanduran.github.io/projects) | [big ideas](https://sanduran.github.io/big_ideas) | [documentation](https://sanduran.github.io/documentation)

# DOCUMENTATION
### Simple Clock using ForEach() and Random()

##### Why Data Is Compressed  
Data compression reduces the size of data to save storage space and/or speed up transmission over networks. Scientifically, it exploits redundancy and patterns in data.  
**Redundancy:** *repeated patterns*  
**Irrelevance:** *certain details can be removed without noticeable loss*  
**Entropy:** *measures the amount of information, compression reduces entropy to represent data more efficiently*  

##### Compression Algorithms  
Compression algorithms are classified into two main types:
1.	Lossless Compression
No data is lost; original data can be perfectly reconstructed.  
Examples:  
**Run-Length Encoding (RLE):** *Replaces repeated values with a count.*  
**Huffman Coding:** *Uses variable-length codes for frequent symbols.*  
**Lempel-Ziv-Welch (LZW):** *Builds a dictionary of repeated patterns.*  
Used in: Text files, PNG images, PDF files, some video codecs (like lossless H.264).
2.	Lossy Compression
Some data is discarded to achieve higher compression. Human perception tolerates the loss.  
Examples:  
**JPEG:** *Removes less noticeable visual details.*  
**MP3:** *Discards audio frequencies less audible to humans.*  
**H.264/HEVC:** *Video compression removes spatial and temporal redundancies.*  
Used in: Images, videos, audio.

Note: Video, photo, text, and audio compression all rely on the same core principles (redundancy reduction, entropy coding) but use different specialized algorithms because of the data type’s characteristics.

##### Compression Programs and Tools

You can compress files both online and offline using various programs:  
| Data Type | Example Programs/Tools | Compression Method and Features |
|---|---|---|
| picture | JPEG compression via Photoshop, GIMP, online TinyPNG | Lossy: reduces color precision, removes invisible details; Lossless PNG uses DEFLATE(ZIP-based) |
| video | HandBrake, FFmpeg, VLC | Lossy: H.264/H.265 encoding, reduces frame redundancies, chroma subsampling |
| text | 7-Zip, WinRAR, gzip | Lossless: LZ77/LZ78, Huffman coding, dictionary compression |
| PDF | Adobe Acrobat, SmallPDF online | Both: compress images inside PDF (lossy), text streams (lossless), remove metadata |
