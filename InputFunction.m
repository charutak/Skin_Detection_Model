% INPUTING THE DATA
% Inputing the images
ImageFolder = 'ibtd\';
if ~isdir(ImageFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', ImageFolder);
  uiwait(warndlg(errorMessage));
  return;
end

FilePattern = fullfile(ImageFolder, '*.jpg');
jpegFiles = dir(FilePattern);
for k = 1:length(jpegFiles)
%for k = 1:5
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(ImageFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  eval(['ImageArray' num2str(k) '= imread(fullFileName);']);
end

% Inputing the maskss

MaskFolder = 'ibtd\Mask';
if ~isdir(MaskFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', MaskFolder);
  uiwait(warndlg(errorMessage));
  return;
end

MaskFilePattern = fullfile(MaskFolder, '*.bmp');
bmpFiles = dir(MaskFilePattern);
for k = 1:length(bmpFiles)
%for k = 1:5
  baseFileName = bmpFiles(k).name;
  fullFileName = fullfile(MaskFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  eval(['MaskArray' num2str(k) '= imread(fullFileName);']);
end
