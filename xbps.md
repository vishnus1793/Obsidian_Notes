# XBPS Package System - Pure Technical Wisdom  

## 1. Basics  
- **XBPS (X Binary Package System)**: Package manager for Void Linux.  
- **Core Components:**  
  - `xbps-install` → Install packages  
  - `xbps-remove` → Remove packages  
  - `xbps-query` → Query package info  
  - `xbps-reconfigure` → Reconfigure packages  
  - `xbps-alternatives` → Manage alternative binaries  
  - `xbps-pkgdb` → Manage package database  
  - `xbps-src` → Build packages from source  

## 2. Updating & Syncing  
- **Update package lists:**  
  ```sh
  xbps-install -S
  ```
- **Upgrade all installed packages:**  
  ```sh
  xbps-install -Su
  ```
- **Downgrade a package (if newer version is unstable):**  
  ```sh
  xbps-install -Su oldpkgname
  ```

## 3. Installing & Removing Packages  
- **Install a package:**  
  ```sh
  xbps-install packagename
  ```
- **Install multiple packages:**  
  ```sh
  xbps-install package1 package2
  ```
- **Remove a package:**  
  ```sh
  xbps-remove packagename
  ```
- **Remove unused dependencies:**  
  ```sh
  xbps-remove -o
  ```

## 4. Querying Package Information  
- **List installed packages:**  
  ```sh
  xbps-query -l
  ```
- **Check if a package is installed:**  
  ```sh
  xbps-query packagename
  ```
- **Search for a package:**  
  ```sh
  xbps-query -Rs packagename
  ```
- **Show package dependencies:**  
  ```sh
  xbps-query -x packagename
  ```

## 5. Managing Repositories  
- **List configured repositories:**  
  ```sh
  xbps-query -L
  ```
- **Add a new repository (edit manually):**  
  ```sh
  nano /etc/xbps.d/*.conf
  ```
- **Enable nonfree packages:**  
  ```sh
  xbps-install void-repo-nonfree
  ```

## 6. Fixing & Reconfiguring Packages  
- **Reinstall a package:**  
  ```sh
  xbps-install -f packagename
  ```
- **Reconfigure all packages:**  
  ```sh
  xbps-reconfigure -a
  ```
- **Reconfigure a specific package:**  
  ```sh
  xbps-reconfigure packagename
  ```

## 7. Building Packages from Source (xbps-src)  
- **Setup xbps-src:**  
  ```sh
  git clone https://github.com/void-linux/void-packages.git
  cd void-packages
  ./xbps-src binary-bootstrap
  ```
- **Build a package:**  
  ```sh
  ./xbps-src pkg packagename
  ```
- **Install the built package:**  
  ```sh
  xbps-install --repository=hostdir/binpkgs packagename
  ```
- **Clean build artifacts:**  
  ```sh
  ./xbps-src clean packagename
  ```

## 8. Debugging & Repairing  
- **Check package database integrity:**  
  ```sh
  xbps-pkgdb -a
  ```
- **Find missing dependencies:**  
  ```sh
  xbps-query -M
  ```
- **Manually install missing dependencies:**  
  ```sh
  xbps-install -y
  ```

## 9. Miscellaneous  
- **Check XBPS version:**  
  ```sh
  xbps-install -V
  ```
- **Show package history:**  
  ```sh
  xbps-query --history
  ```
- **List files owned by a package:**  
  ```sh
  xbps-query -f packagename
  ```
- **Check package size before installation:**  
  ```sh
  xbps-query -Rs packagename | grep -i size
  ```
