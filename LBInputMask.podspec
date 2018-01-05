Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '11.0'
s.name = "LBInputMask"
s.summary = "LBInputMask make a mask for UITextFields."
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Lucas Bordini" => "lucas.bordini@hotmail.com" }

# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/lucasbordini/LBInputMask"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/lucasbordini/LBInputMask.git", :tag => "#{s.version}"}

# 7
s.framework = "UIKit"
s.framework = "Foundation"

# 8
s.source_files = "LBInputMask/*.{swift}"

end
