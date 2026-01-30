### 🔧 Possible Workarounds

1. **Open a “Blank Window” instead of a new synced one**
    
    - Use the menu option **“New Blank Window”** (or **Ctrl + Alt + N** on Windows, or **Alt + N**) to create a window that doesn’t immediately sync all tabs.
        
    - Note: It will still share cookies and history, but starts without mirroring all tabs.
        
2. **Advanced setting via about:config** _(experimental & riskier)_
    
    - Zen’s developers have added internal flags such as `zen.window-sync.enabled` that can potentially control this behavior, but this isn’t documented officially and may require a restart. There's no guarantee this flag fully disables sync for all use cases.
        
    - To try:
        
        1. Go to `about:config` in the Zen address bar.
            
        2. Search for `zen.window-sync.enabled`.
            
        3. Set it to **false**.
            
        4. Restart the browser.
            
    - **Note:** Changing `about:config` flags can destabilize the browser if you aren’t familiar with them.
        
3. **Separate browser profiles**
    
    - If you need _truly independent windows_, consider launching completely separate **browser profiles** (each with its own profile directory).
        
    - Zen doesn’t expose profile UI management, but you can start different instances with distinct profiles from the command line (similar to Firefox).
        
    - This approach _completely isolates_ sessions and tabs, avoiding window sync entirely.