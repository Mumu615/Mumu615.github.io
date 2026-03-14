const fs = require('fs');
const path = require('path');

const sourcePath = path.join(hexo.base_dir, 'custom-layouts', 'navpage.pug');
const targetDir = path.join(hexo.theme_dir, 'layout');
const targetPath = path.join(targetDir, 'navpage.pug');

if (fs.existsSync(sourcePath)) {
  const content = fs.readFileSync(sourcePath, 'utf8');
  fs.mkdirSync(targetDir, { recursive: true });

  if (!fs.existsSync(targetPath) || fs.readFileSync(targetPath, 'utf8') !== content) {
    fs.writeFileSync(targetPath, content);
  }
}
