# Compressing PDF to 50KB on Fedora Linux

## Installation

Before starting, install Ghostscript if it's not already installed:

```
sudo dnf install ghostscript -y
```

## Steps to Compress ".pdf" to 50KB

### 1. Compress Using Ghostscript

Run the following command to compress the PDF while maintaining readability:

```sh
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dPDFSETTINGS=/screen -r50 \
   -dColorImageResolution=50 -dGrayImageResolution=50 -dMonoImageResolution=50 \
   -dNOPAUSE -dQUIET -dBATCH -sOutputFile=compressed_sna.pdf "<FILENAME>.pdf"
```

### 2. Rename the Compressed File

Once compression is complete, rename it for clarity:

```sh
mv compressed_sna.pdf "Social Network Analysis (Compressed).pdf"
```

### 3. Verify the File Size

Check the size of the compressed file:

```sh
ls -lh "Social Network Analysis (Compressed).pdf"
```

### 4. Adjust Compression if Necessary

- If the file is still **above 50KB**, reduce DPI further (e.g., `-r30` or `-r25`).
- If the file quality is too low, try increasing DPI slightly (e.g., `-r75`).