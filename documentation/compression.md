##### Why Data Is Compressed

Data compression reduces the size of data to save storage space and/or speed up transmission over networks. Scientifically, it exploits redundancy and patterns in data:
Redundancy: Repeated patterns.
Irrelevance: Certain details can be removed without noticeable loss.
Entropy: Measures the amount of information, compression reduces entropy to represent data more efficiently.

##### Compression Algorithms

Compression algorithms are classified into two main types:
1.	Lossless Compression
No data is lost; original data can be perfectly reconstructed.
Examples:
Run-Length Encoding (RLE): Replaces repeated values with a count.
Huffman Coding: Uses variable-length codes for frequent symbols.
Lempel-Ziv-Welch (LZW): Builds a dictionary of repeated patterns.
Used in: Text files, PNG images, PDF files, some video codecs (like lossless H.264).
2.	Lossy Compression
	•	Some data is discarded to achieve higher compression. Human perception tolerates the loss.
	•	Examples:
	•	JPEG: Removes less noticeable visual details.
	•	MP3: Discards audio frequencies less audible to humans.
	•	H.264/HEVC: Video compression removes spatial and temporal redundancies.
	•	Used in: Images, videos, audio.

Note: Video, photo, text, and audio compression all rely on the same core principles (redundancy reduction, entropy coding) but use different specialized algorithms because of the data type’s characteristics.

⸻

3. Compression Programs / Tools

You can compress files both online and offline using various programs:
